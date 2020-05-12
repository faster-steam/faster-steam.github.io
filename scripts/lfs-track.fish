# broadly determine image files to track
find assets/ -name '*.psd' -type f -printf '%f\n' > resources/track.lfs.txt
find assets/ -name '*.eps' -type f -printf '%f\n' >> resources/track.lfs.txt
find assets/ -name '*.jpg' -type f -printf '%f\n' >> resources/track.lfs.txt
find assets/ -name '*.png' -type f -printf '%f\n' >> resources/track.lfs.txt

# determine files that are in only track.lfs.txt
comm -3 -1 resources/no-track.lfs.txt resources/track.lfs.txt

# LFS track only the files in track.lfs.txt
git lfs track (comm -3 -1 resources/no-track.lfs.txt resources/track.lfs.txt)
