pimatic-customcss
=======================

This is a little helper plugin for the technically savvy user, it is not recommendet for users without a background in CSS.
Its a wrapper that enables the user to load his own custom CSS into the pimatic-mobile-frontend, withoud editing mobile-frontend-plugin files.

So you can update the pimatic-mobile-frontend-plugin without losing your custom CSS.

Please be advised that you use plugin on your own risk, If your break the frontend with your CSS don't blame me.
Please don't start questions like "How can i change the background color of xyz" or open issues for that.

I deliver only the tool to load your CSS, everythig else is on your side :-)

See "Usage" for the detailed usage of the plugin.

### Sponsoring

Do you like this plugin? Then please consider a donation to support the development.

<span class="badge-paypal"><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ZSZE2U9Z6J26U" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal Donate Button" /></a></span>

<a href="https://flattr.com/submit/auto?fid=jeo2wl&url=https%3A%2F%2Fgithub.com%2Ffbeek%2Fpimatic-maxcul" target="_blank"><img src="http://button.flattr.com/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0"></a>

Information
---------

Because of the support ending for pimatic 0.8.x, we from now on support only pimatic > 0.9.x !


Usage
---------

After the installation of the plugin, please restart pimatic.
After that you will find a folder "customAssets" in your pimatic root folder (the folder where you can find your config.json).
In this folder you find a user.css, in this file you can add your custom css.

After that you have to restart pimatic again and completely clear your browser cache.

While this restart the plugin copies your CSS file to /node_modules/pimatic-customcss/app/css/user.css, this has to be done because from a different folder the mobile-frontend will not load the custom CSS file.
When the file is copied to the destination it will be inluded.

Please be advised that you have to select your CSS selector precisely, so that they will override the original styles. Eventually you have to use !important.

After each change of the CSS file you have to clear the cache and restart pimatic. While developing you can enbale the deleopment mode of the frontend.

Changelog
---------------

0.1.0 First stable release

ToDo
---------------

- Develop a concept for background image support
