#!/bin/bash

image=$1

# Move it to the originals directory
if [ ! -f originals/$image ]; then
  mv $image originals/$image
fi

# (1) Resize, compress, save to $image; (2) copy to MIA_exhibition-signature.jpg; (3) rsync
gm convert -resize 350x -compress JPEG -quality 90 originals/$image $image
cp $image MIA-exhibition-signature.jpg
rsync -av * archive:email-banners/
