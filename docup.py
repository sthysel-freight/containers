#! /usr/bin/env python

import os

excludes = [".git"]
outfile_name = "README.md"

readme_header="""
# Docker containers

A set of possibly usefull Docker images to amuse and tool arround with.


"""
entry_template="##[{0}]({0})"


def get_description(dir):
    """ get the container short description """

    # container short description is first line in README.md
    try:
        with open("./{}/README.md".format(dir)) as readme:
            description = readme.readline()
            return description.translate(None, '#').strip()
    except IOError:
        print("{} does not have a README.md".format(dir))
        return ""

def make_new_readme(dirs):
    try:
        with open(outfile_name, 'w') as f:
            f.write(readme_header)
            for dir in dirs:
                f.write(entry_template.format(dir) + "\n")
                f.write(get_description(dir) + "\n\n")
    except IOError, e:
        print e

def main():
    """ Make README.md """
    alldirs = next(os.walk("."))[1]
    alldirs.sort()
    dirs = [d for d in alldirs if d not in excludes]

    make_new_readme(dirs)


if __name__ == "__main__":
    main()
