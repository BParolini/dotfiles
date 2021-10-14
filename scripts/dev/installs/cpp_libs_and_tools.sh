#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs C/C++ development libraries, debug info, Qt Creator and CodeBlocks

echo "Installing C/C++ libs, tools and IDEs"

echo "Installing CLang"
dnf install -yb clang clang-devel clang-libs clang-resource-filesystem clang-tools-extra

echo
echo "=============================="
echo

echo "Installing Cmake and csbuild"
dnf install -yb cmake cmake-data cmake-filesystem cmake-gui extra-cmake-modules patch csbuild

echo
echo "=============================="
echo

echo "Installing autoconf and automake"
dnf install -yb autoconf automake

echo
echo "=============================="
echo

echo "Installing Qt 5"
dnf install -y $(dnf search qt5 | grep '^qt5-*.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)
dnf debuginfo-install -y $(dnf search qt5 | grep '^qt5-*.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)

echo
echo "=============================="
echo

echo "Installing Qt 6"
dnf install -y $(dnf search qt6 | grep '^qt6-*.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)
dnf debuginfo-install -y $(dnf search qt6 | grep '^qt6-*.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)

echo
echo "=============================="
echo

echo
echo "Installing Boost"
dnf install -y $(dnf search boost | grep '^boost-*.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)
dnf debuginfo-install -y $(dnf search boost | grep '^boost-*.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)

echo
echo "=============================="
echo

echo
echo "Installing SDL 2"
dnf install -y $(dnf search SDL2 | grep '^SDL2[-_]*.*[-devel]' | grep x86_64 | awk '{print $1}' | uniq | sort)
dnf debuginfo-install -y $(dnf search SDL2 | grep '^SDL2[-_]*.*[-devel]' | grep x86_64 | awk '{print $1}' | uniq | sort)

echo
echo "=============================="
echo

echo
echo "Installing Allegro 5"
dnf install -y $(dnf search allegro5 | grep '^allegro5.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)
dnf debuginfo-install -y $(dnf search allegro5 | grep '^allegro5.*[-devel]' | grep devel | grep x86_64 | awk '{print $1}' | uniq | sort)

echo
echo "=============================="
echo

echo
echo "Installing C/C++ IDEs"
dnf install -y qt5 qt6 qt-creator qt-creator-data qt-creator-doc
