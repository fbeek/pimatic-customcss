module.exports = (env) ->

  Promise = env.require 'bluebird'
  assert = env.require 'cassert'
  fs = require 'fs-extra'
  path = env.require 'path'

  class CustomcssPlugin extends env.plugins.Plugin
    init: (@app, @framework, @config) =>
      env.logger.info("checking for custom css...")

      # wait till all plugins are loaded
      @framework.on "after init", =>
        # Check if the mobile-frontent was loaded and get a instance, without this our plugin makes no sense :-)
        mobileFrontend = @framework.pluginManager.getPlugin 'mobile-frontend'
        if mobileFrontend?
          rootPath = path.normalize(path.join(__dirname, '/../..'))
          folderName = 'customAssets'

          assetFolderPath = path.normalize(path.join(rootPath, folderName))
          userCssFile = path.normalize(path.join(assetFolderPath,'user.css'))

          internalFilePath = path.normalize(path.join('pimatic-customcss/app/css/','user.css'))
          try
            if !fs.existsSync(assetFolderPath)
              fs.mkdirSync(assetFolderPath)

            if !fs.existsSync(userCssFile)
              handle = fs.openSync(userCssFile, 'w+')
              fs.closeSync(handle);

            fs.copySync(userCssFile,internalFilePath)    
            
            if fs.existsSync(internalFilePath)
              env.logger.info "custom css file registered"
              mobileFrontend.registerAssetFile 'css', internalFilePath
            else
              env.logger.info "customcss_user.css file is missing !"
          catch error 
            env.logger.warn error
        else
          env.logger.warn "Customcss could not find the mobile-frontend. No gui will be available, so this plugin makes no sense :-)"

  customcssPlugin = new CustomcssPlugin
  return customcssPlugin