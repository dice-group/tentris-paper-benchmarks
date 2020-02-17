#! /bin/bash

mkdir -p {{ database_base_dir }}/virtuoso/{{ item[1].name }}/database
mkdir -p {{ database_base_dir }}/virtuoso/{{ item[1].name }}/vad
mkdir -p {{ database_base_dir }}/virtuoso/{{ item[1].name }}/vsp
