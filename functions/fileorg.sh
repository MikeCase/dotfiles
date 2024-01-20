downloads_org() {
    ## Keep my downloads folder CLEAN & Organzied
    echo "Organizing ${DLDIR}"
    for file in ${DLDIR}/*; do
        if [ -f "${file}" ]; then
            case "${file}" in
                *.iso)
                    echo ${file}
                    if [ -d $DLDIR/images ]; then
                        echo "moving ${file} to ${DLDIR}/images/"
                        mv "${file}" "${DLDIR}/images/"
                    else
                        echo "creating directory ${DLDIR}/images/"
                        mkdir -p $DLDIR/images
                        echo "moving ${file} to ${DLDIR}/images/"
                        mv $file $DLDIR/images/
                    fi
                ;;
                *.pdf | *.csv | *.txt | *.xlsx | *.md | *.fig | *.htm | *.html)
                    echo ${file}
                    if [ -d $DLDIR/documents ]; then
                        echo "moving ${file} to ${DLDIR}/documents/"
                        mv "${file}" "${DLDIR}/documents/"
                    else
                        echo "creating directory ${DLDIR}/documents/"
                        mkdir -p $DLDIR/documents
                        echo "moving ${file} to ${DLDIR}/documents/"
                        mv $file $DLDIR/documents/
                    fi
                ;;
                *.tar.gz | *.7z | *.Z | *.tar.bz2 | *.bz2 | *.gz | *.zip | *.tbz2 | *.tgz | *.rar | *.tar | *.xz | *.tar.xz)
                    echo ${file}
                    if [ -d $DLDIR/archives ]; then
                        echo "moving ${file} to ${DLDIR}/archives/"
                        mv "${file}" "${DLDIR}/archives/"
                    else
                        echo "creating directory ${DLDIR}/archives/"
                        mkdir -p $DLDIR/archives
                        echo "moving ${file} to ${DLDIR}/archives/"
                        mv $file $DLDIR/archives/
                    fi
                ;;
                *.deb)
                    echo ${file}
                    if [ -d $DLDIR/packages ]; then
                        echo "moving ${file} to ${DLDIR}/packages/"
                        mv "${file}" "${DLDIR}/packages/"
                    else
                        echo "creating directory ${DLDIR}/packages/"
                        mkdir -p $DLDIR/packages
                        echo "moving ${file} to ${DLDIR}/packages/"
                        mv $file $DLDIR/packages/
                    fi
                ;;
                *.mp3 | *.ogg)
                    echo ${file}
                    if [ -d $DLDIR/music ]; then
                        echo "moving ${file} to ${DLDIR}/music/"
                        mv "${file}" "${DLDIR}/music/"
                    else
                        echo "creating directory ${DLDIR}/music/"
                        mkdir -p $DLDIR/music
                        echo "moving ${file} to ${DLDIR}/music/"
                        mv $file $DLDIR/music/
                    fi
                ;;
                *.wav)
                    echo ${file}
                    if [ -d $DLDIR/SFX ]; then
                        echo "moving ${file} to ${DLDIR}/SFX/"
                        mv "${file}" "${DLDIR}/SFX/"
                    else
                        echo "creating directory ${DLDIR}/SFX/"
                        mkdir -p $DLDIR/SFX
                        echo "moving ${file} to ${DLDIR}/SFX/"
                        mv $file $DLDIR/SFX/
                    fi
                ;;
                *.mpv | *.mp4 | *.avi | *.mpg | *.mpeg)
                    echo ${file}
                    if [ -d $DLDIR/videos ]; then
                        echo "moving ${file} to ${DLDIR}/videos/"
                        mv "${file}" "${DLDIR}/videos/"
                    else
                        echo "creating directory ${DLDIR}/videos/"
                        mkdir -p $DLDIR/videos
                        echo "moving ${file} to ${DLDIR}/videos/"
                        mv $file $DLDIR/videos/
                    fi
                ;;
                *.jpg | *.jpeg | *.png | *.tiff | *.bmp | *.webp)
                    echo ${file}
                    if [ -d $DLDIR/pictures ]; then
                        echo "moving ${file} to ${DLDIR}/pictures/"
                        mv "${file}" "${DLDIR}/pictures/"
                    else
                        echo "creating directory ${DLDIR}/pictures/"
                        mkdir -p $DLDIR/pictures
                        echo "moving ${file} to ${DLDIR}/pictures/"
                        mv $file $DLDIR/pictures/
                    fi
                ;;
            esac
        fi
    done
}