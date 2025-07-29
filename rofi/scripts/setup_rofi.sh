#!/bin/sh

ROFI_THEME="$HOME/.config/rofi/config.rasi"
TEMPLATE_FILE="$HOME/.config/rofi/config_template.rasi"

ROFI_FONT="Hasklug Nerd Font Medium 10"
ICON_THEME="Papirus"

# Read the file line-by-line into an array
mapfile -t colors < /home/cheetah/.cache/wal/colors

# Now assign each line to a variable dynamically
for i in "${!colors[@]}"; do
  # Use declare to create variables like color0, color1, ...
  declare "color$i=${colors[$i]}"
done


cat > "$ROFI_THEME" <<EOF

configuration {
    display-drun: "";
    display-window: "Windows:";
    drun-display-format: "{icon} {name}";
    font: "$ROFI_FONT";
    modi: "window,run,drun";
    show-icons: true;
    icon-theme: "$ICON_THEME";
}

@theme "/dev/null"

*{
    color0: $color0;
    color1: $color1;
    color2: $color2;
    color3: $color3;
    color4: $color4;
    color5: $color5;
    color6: $color6;
    color7: $color7;
    color8: $color8;
    color9: $color9;
    color10: $color10;
    color11: $color11;
    color12: $color12;
    color13: $color13;
    color14: $color14;
    color15: $color15;

    border-color:                rgb(185, 185, 185);
    spacing:                     2;
    separatorcolor:              rgb(29, 31, 33);

    background:                  rgb(15, 18, 31);
    foreground:                  rgb( 196, 203, 212 );

    normal-background:           @background;
    normal-foreground:           @foreground;

    selected-background:         rgb(18, 36, 58);   
    selected-foreground:         rgb( 249, 249, 249 );
    
    lightfg:                     rgb( 88, 104, 117 );
    urgent-foreground:           rgb( 204, 102, 102 );
    active-foreground:           rgb( 101, 172, 255 );
    selected-normal-foreground:  rgb( 249, 249, 249 );
    selected-urgent-foreground:  rgb( 249, 249, 249 );
    selected-active-foreground:  rgb( 249, 249, 249 );
    alternate-normal-foreground: @foreground;
    alternate-urgent-foreground: @urgent-foreground;
    alternate-active-foreground: @active-foreground;

    
    lightbg:                     rgb( 238, 232, 213 );
    urgent-background:           rgb( 29, 31, 33 );
    active-background:           rgb( 29, 31, 33 );
    selected-normal-background:  rgb(30, 59, 95);
    selected-urgent-background:  rgb( 165, 66, 66 );
    selected-active-background:  rgb( 68, 145, 237 );
    alternate-normal-background: rgb( 64, 69, 82 );
    alternate-urgent-background: rgb( 75, 81, 96 );
    alternate-active-background: rgb( 75, 81, 96 );
    
    background-color:rgba(0, 0, 0, 0);
    text-color: @color2;
}

EOF

cat $TEMPLATE_FILE >> $ROFI_THEME
