#!/usr/bin/env bash

dpkg-scanpackages -m . /dev/null | gzip -9c > Packages.gz
