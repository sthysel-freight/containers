#! /usr/bin/env python

import os

excludes = [".git"]
outfile_name = "README.md"

readme_header="""
# Docker containers

A set of possibly usefull Docker images to amuse and tool arround with.


"""
entry_template="##[{0}]({1})"

def get_far_containers():
    """ submodule links should go to the submodule repo """

    modules = {}
    path = ""
    url = ""
    try:
        with open(".gitmodules") as dotgitmodules:
            for line in dotgitmodules:
                if line.find("submodule") != -1:
                    path = ""
                    url = ""
                if line.find("path =") != -1:
                    path = line.split("=")[1].strip()
                if line.find("url =") != -1:
                    url = line.split("=")[1].strip().replace(":", "/").replace("git@", "http://")
                    modules[path] = url
    except IOError:
        print("No sbumodules file")
    return modules

def get_description(dir):
    """ get the container short description """

    # container short description is first line in README.md
    try:
        with open("./{}/README.md".format(dir)) as readme:
            description = readme.read()
            return description.translate(None, '#').strip()
    except IOError:
        print("{} does not have a README.md".format(dir))
        return ""

def make_new_readme(containers):
    try:
        with open(outfile_name, 'w') as f:
            f.write(readme_header)
            for name, url in containers.items():
                f.write(entry_template.format(name, url) + "\n")
                f.write(get_description(name) + "\n\n")
    except IOError, e:
        print e

def get_local_containers():
    """ local directories """

    alldirs = next(os.walk("."))[1]
    alldirs.sort()
    dirs = [d for d in alldirs if d not in excludes]

    return dict(zip(dirs, dirs))

def main():
    """ Make README.md """
    far = get_far_containers()
    local = get_local_containers()

    containers = local.copy()
    containers.update(far)

    make_new_readme(containers)


if __name__ == "__main__":
    main()
