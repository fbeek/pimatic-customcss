module.exports = (env) ->

  Promise = env.require 'bluebird'
  assert = env.require 'cassert'
  fs = env.require 'fs.extra'
  path = env.require 'path'

  class CustomcssPlugin extends env.plugins.Plugin
    init: (@app, @framework, @config) =>
      env.logger.info("checking for custom css...")

      # wait till all plugins are loaded
      @framework.on "after init", =>
        # Check if the mobile-frontent was loaded and get a instance, without this our plugin makes no sense :-)
        mobileFrontend = @framework.pluginManager.getPlugin 'mobile-frontend'
        if mobileFrontend?
          filepathShort = path.join('pimatic-customcss/app/css/','customcss_user.css')
          filepathShort = path.normalize(filepathShort)

          filepathLong = path.join(__dirname, '/app/css/','customcss_user.css')
          filepathLong = path.normalize(filepathLong)
          
          if fs.existsSync(filepathLong)
            env.logger.info "custom css file loaded "
          else
            handle = fs.openSync(filepathLong, 'w+')
            fs.closeSync(handle);          
            env.logger.info "customcss_user.css file was missing, file created and loaded !"

          mobileFrontend.registerAssetFile 'css', filepathShort  
        else
          env.logger.warn "Customcss could not find the mobile-frontend. No gui will be available, so this plugin makes no sense :-)"

  customcssPlugin = new CustomcssPlugin
  return customcssPlugin