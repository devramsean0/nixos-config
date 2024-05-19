BAT=$(acpi -b | grep -E -o '[0-9][0-9][0-9]?%')
# BAT=020
# Full and short texts
echo "Battery: $BAT"
echo "BAT: $BAT"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 005 ] && exit 033
[ ${BAT%?} -le 020 ] && echo "#FF8000"

exit 0
