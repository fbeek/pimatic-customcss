module.exports = (env) ->

  Promise = env.require 'bluebird'
  assert = env.require 'cassert'

  class CustomcssPlugin extends env.plugins.Plugin
    init: (@app, @framework, @config) =>
      env.logger.info("")

      # wait till all plugins are loaded
      @framework.on "after init", =>
        # Check if the mobile-frontent was loaded and get a instance, without this our plugin makes no sense :-)
        mobileFrontend = @framework.pluginManager.getPlugin 'mobile-frontend'
        if mobileFrontend?
          mobileFrontend.registerAssetFile 'css', "pimatic-dwd/app/css/dwd.css"
          env.logger.debug "custum css file loaded"
        else
          env.logger.warn "Customcss could not find the mobile-frontend. No gui will be available, so this plugin makes no sense :-)"

  customcssPlugin = new CustomcssPlugin
  return customcssPlugin
