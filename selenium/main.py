import time
import argparse
import csv

import javascriptkeys

from functools import reduce

from selenium import webdriver
from selenium.webdriver.common.keys import Keys


def main():
    parser = argparse.ArgumentParser(
        description="Send RHCOS Install params to VMWare® Vsphere® 6.7 with Selenium.")
    parser.add_argument('-w', '--webdriver-dir',
                        help='Webdriver Folder', default='', dest='webdriver')
    parser.add_argument('-vu', '--vsphere-url',
                        help='VMWare VSphere URL', default='', dest='vsphereurl')
    parser.add_argument(
        '-u', '--username', help='VMWare VSphere user', default='', dest='username')
    parser.add_argument(
        '-p', '--password', help='VMWare Vsphere password', default='', dest='pass')
    parser.add_argument('-gw', '--gateway', help='IP Gateway',
                        default='', dest='gateway')
    parser.add_argument('-d', '--dns', help='DNS Server',
                        default='', dest='dns')
    parser.add_argument('-m', '--mask', help='Network Mask',
                        default='', dest='mask')
    parser.add_argument('-n', '--network-interface', help='Default Network Interface',
                        default='ens192', dest='networkinterface')
    parser.add_argument('-b', '--base-url', help='FQDN base url',
                        default='ocp.client.com', dest='baseurl')
    parser.add_argument('-i', '--image-url',
                        help='Install Image URL', default='', dest='imageurl')
    parser.add_argument('-ig', '--ignition-url',
                        help='Install Ignition URL', default='', dest='ignitionurl')
    parser.add_argument('-s', '--servers-file',
                        help='Servers csv file', default='servers.csv', dest='serversfile')

    args = parser.parse_args()

    FIREFOX = webdriver.Firefox(args.webdriver)
    FIREFOX.get(args.vsphereurl)
    FIREFOX.find_element_by_class_name('btn-primary').click()
    time.sleep(5)
    FIREFOX.find_element_by_id('username').send_keys(args.username)
    FIREFOX.find_element_by_id('password').send_keys(args.password)
    FIREFOX.find_element_by_id('submit').click()
    time.sleep(10)
    tabs = FIREFOX.find_element_by_class_name(
        'vui-primary-tabs').find_element_by_class_name('nav')
    tabs.find_elements_by_tag_name('li')[1].click()
    time.sleep(2)
    FIREFOX.find_elements_by_class_name(
        'k-bot')[3].find_elements_by_tag_name('span')[0].click()
    group = FIREFOX.find_elements_by_class_name('k-treeview-lines')[1]
    # TODO: search folder instead of first!
    ocpdir = group.find_elements_by_xpath(
        'li/ul[@class="k-group"]/li/ul/li')[1]
    ocpdir.find_element_by_xpath('div/span[contains(@class,"k-plus")]').click()
    vms = ocpdir.find_elements_by_xpath('ul/li')
    vm_include = []
    boot_texts = {}

    # TODO: lambda too
    with open(args.serversfile, newline='') as csvfile:
        lines = csv.reader(csvfile)
        for line in lines:
            vm_include.append(lines[0])
            formmap = {
                'ip': lines[2],
                'gw': args.gateway,
                'msk': args.mask,
                'h': lines[1],
                'base': args.baseurl,
                'dns': args.dns,
                'img': args.imageurl,
                'ign': args.ignitionurl
            }
            boot_texts.append({lines[0]: "ip={ip}::{gw}:{msk}:{h}{base}:{dns}:none nameserver={dns} ".format_map(
                **formmap
            ) + "coreos.inst.install_dev=sda coreos.inst.image_url={img} coreos.inst.ignition_url={ign}".format_map(
                **formmap
            )})
    # TODO: same loop?
    for vm in vms:
        vm_name = vm.find_element_by_xpath("div/span").text
        if reduce(lambda x, y: x or (y in vm_name), [False, *vm_include]):
            vm.click()
            time.sleep(2)
            FIREFOX.find_element_by_class_name(
                'launch-web-console-text').click()
            time.sleep(2)
            # TODO: check if webconsole is default in vsphere
            #! FIREFOX.find_element_by_id('submitBtn').click()
            #! time.sleep(2)
            FIREFOX.switch_to.window(FIREFOX.window_handles[1])
            canvas = FIREFOX.find_element_by_id('mainCanvas')
            canvas.click()
            javascriptkeys.sendText(FIREFOX, boot_texts[vm_name])
            time.sleep(5)
            FIREFOX.close()
            FIREFOX.switch_to.window(FIREFOX.window_handles[0])
        else:
            print(vm_name)


if __name__ == '__main__':
    main()
