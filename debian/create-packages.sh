#!/usr/bin/env bash

dpkg-scanpackages --multiversion . /dev/null | gzip -9c > Packages.gz
