# by discomanfulanito,
# for everyone — as code should be

# Sprites are drawn from here
POKEMON_LIST=(
  "mimikyu"
  "blaziken"
  "arceus"
  "oshawott"
  "articuno"
  "pikachu"
  "darkrai"
  "sylveon"
  "random"
)
# Change with your fetcher
FETCHER="fastfetch"

FETCHER_HEIGHT=$((($($FETCHER | wc -l) + 1) / 2))

# Extra settings
EXTRA_PADDING_H=2
EXTRA_PADDING_W=0

# Room for the sprite
WIDTH=38

# Gets a sprite via pokeget
sprite=$(pokeget ${POKEMON_LIST[RANDOM % ${#POKEMON_LIST[@]}]} --hide-name)

# Gets sprite's height
height=$(echo "$sprite" | wc -l)

# Pad for vertical centering
pad_top=$((($FETCHER_HEIGHT - $height) / 2))
pad_top=$((pad_top + EXTRA_PADDING_H))

# Just for safety
if [ $pad_top -lt 0 ]; then
  pad_top=0
fi

# Gets sprite's sprite_width
sprite_width=0

# Iters sprite's lines
while IFS= read -r line; do
  # Gets line's width
  line_w=${#line}
  # Compare and Update sprite_width
  if ((line_w > sprite_width)); then
    sprite_width=$line_w
  fi
done <<<"$sprite"

# Real sprite_width (idk why the other is scaled)
sprite_width=$(((sprite_width + 35 - 1) / 35))

# Calculate the lateral padding
pad_lat=$((($WIDTH - sprite_width) / 2))
pad_lat=$((pad_lat + EXTRA_PADDING_W))

# Just for safety
if [ $pad_lat -lt 0 ]; then
  pad_lat=0
fi

# this may not work for your fetcher, check them all
echo "$sprite" | $FETCHER --file-raw - --logo-padding-top $pad_top --logo-padding-left $pad_lat --logo-padding-right $pad_lat
