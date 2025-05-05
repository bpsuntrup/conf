# fvim()
#
# fg only the vim instance

function fvim()
{
    fg $(jobs | awk '/vim/ {print $1}' | grep -Eo '[0-9]+' | head -n 1)
}
