function dmg2iso() {
  dmg_file=$1
  iso_file=$(basename ${dmg_file} | sed 's/dmg$/iso/')
  hdiutil convert ${dmg_file} -format UDTO -o ${iso_file} && \
    mv ${iso_file}.cdr ${iso_file}
}
