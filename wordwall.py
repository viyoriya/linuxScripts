import os
from wordcloud import WordCloud, ImageColorGenerator
import numpy as np
from PIL import Image
from datetime import datetime

WIDTH=1280
HEIGHT=800
MAX_WORDS=2000
FONT_SIZE=40
BG_COLOR='#000000'
usr=os.path.expanduser('~')
txtFile=usr+"/.bash_history"
maskFile=usr+"/Pictures/Wallpapers/SolusMaskHD_rgb.png"
wallpaperPath=usr+"/Pictures/Wallpapers/wordcloud_"+datetime.now().strftime("%d-%m-%Y_%H-%M-%S")+".png"

txt = open(txtFile, 'r').read()
solus_mask = np.array(Image.open(maskFile))

wc = WordCloud(width = WIDTH, height = HEIGHT, background_color=BG_COLOR,max_words=MAX_WORDS, mask=solus_mask, max_font_size=FONT_SIZE,random_state=45, relative_scaling=0).generate(txt)
wallpaper_colors = ImageColorGenerator(solus_mask)
wc.recolor(color_func=wallpaper_colors)
wc.to_file(wallpaperPath)

#Save the text as wordCount.py
#run in terminal
#sudo pip3 install wordcloud
#python3 wordCount.py