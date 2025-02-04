#!/bin/bash

export PATH="$VSC_SCRATCH/containers/bsoup/bin:$PATH"

which python # To verify that it is using the container python
python -c "from bs4 import BeautifulSoup; soup = BeautifulSoup('<p>Hello World</p>', 'html.parser'); print(soup.p.text)"
