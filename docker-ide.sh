#!/usr/bin/env  bash

docker run -it --name my_project_container -v "$(pwd)/proj:/home/developer/proj" your_image_name:your_image_tag
