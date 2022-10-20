# intended to be invoked with home-manager
{ config, pkgs, lib, ... }:

let
  cfg = config.firefox;
in
{
  options.firefox = {
    enable = lib.mkEnableOption "Install and configure Wayland Firefox";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
      profiles = {
        myprofile = {
          settings = {
            "accessibility.typeaheadfind.flashBar" = 0;
            "accessibility.typeaheadfind.manual" = false;
            "app.normandy.api_url" = "";
            "app.normandy.enabled" = false;
            "app.normandy.first_run" = false;
            "app.normandy.migrationsApplied" = 12;
            "app.normandy.startupRolloutPrefs.browser.migrate.showBookmarksToolbarAfterMigration" = true;
            "app.normandy.startupRolloutPrefs.doh-rollout.enabled" = true;
            "app.normandy.startupRolloutPrefs.doh-rollout.profileCreationThreshold" = "1896163212345";
            "app.normandy.startupRolloutPrefs.extensions.formautofill.creditCards.available" = true;
            "app.normandy.startupRolloutPrefs.extensions.formautofill.creditCards.enabled" = true;
            "app.normandy.startupRolloutPrefs.extensions.formautofill.creditCards.hideui" = false;
            "app.normandy.startupRolloutPrefs.media.videocontrols.picture-in-picture.video-toggle.mode" = 2;
            "app.normandy.startupRolloutPrefs.pdfjs.renderInteractiveForms" = true;
            "app.normandy.startupRolloutPrefs.security.bad_cert_domain_error.url_fix_enabled" = true;
            "app.normandy.startupRolloutPrefs.security.remote_settings.intermediates.downloads_per_poll" = 3000;
            "app.normandy.user_id" = "b54385b4-c96c-4209-b1fc-f6a78b725152";
            "app.shield.optoutstudies.enabled" = false;
            "app.update.lastUpdateTime.addon-background-update-timer" = 1628971674;
            "app.update.lastUpdateTime.browser-cleanup-thumbnails" = 1628975034;
            "app.update.lastUpdateTime.recipe-client-addon-run" = 1611661469;
            "app.update.lastUpdateTime.region-update-timer" = 1628879111;
            "app.update.lastUpdateTime.rs-experiment-loader-timer" = 1608410929;
            "app.update.lastUpdateTime.search-engine-update-timer" = 1628956804;
            "app.update.lastUpdateTime.services-settings-poll-changes" = 1628971554;
            "app.update.lastUpdateTime.telemetry_modules_ping" = 1611591738;
            "app.update.lastUpdateTime.xpi-signature-verification" = 1628971794;
            "beacon.enabled" = false;
            "breakpad.reportURL" = "";
            "browser.aboutConfig.showWarning" = false;
            "browser.bookmarks.defaultLocation" = "unfiled";
            "browser.bookmarks.editDialog.confirmationHintShowCount" = 25;
            "browser.bookmarks.editDialog.firstEditField" = "tagsField";
            "browser.contentblocking.category" = "custom";
            "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
            "browser.disableResetPrompt" = true;
            "browser.discovery.enabled" = false;
            "browser.download.lastDir" = "/home/prussian/Downloads";
            "browser.download.panel.shown" = true;
            "browser.download.save_converter_index" = 0;
            "browser.download.viewableInternally.typeWasRegistered.svg" = true;
            "browser.download.viewableInternally.typeWasRegistered.webp" = true;
            "browser.download.viewableInternally.typeWasRegistered.xml" = true;
            "browser.eme.ui.firstContentShown" = true;
            "browser.engagement.downloads-button.has-used" = true;
            "browser.engagement.fxa-toolbar-menu-button.has-used" = true;
            "browser.engagement.home-button.has-used" = true;
            "browser.engagement.library-button.has-used" = true;
            "browser.engagement.sidebar-button.has-used" = true;
            "browser.fixup.alternate.enabled" = false;
            "browser.migration.version" = 109;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
            "browser.newtabpage.activity-stream.discoverystream.rec.impressions" = "{\"73704\":1604254629189,\"74311\":1604254629185,\"74315\":1604254629189,\"74335\":1604254629188,\"20830549\":1604254629185,\"20946647\":1604254629187}";
            "browser.newtabpage.activity-stream.discoverystream.spoc.impressions" = "{\"12532984\":[1604254629183,1604254703336,1604254744017,1604254768791],\"12722773\":[1604254629186,1604254703338,1604254744019,1604254768789]}";
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.impressionId" = "{820a29a1-b510-460f-8dd5-88da3bb4356a}";
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "amazon";
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "browser.newtabpage.activity-stream.showSearch" = false;
            "browser.newtabpage.activity-stream.topSitesRows" = 7;
            "browser.newtabpage.blocked" = "{\"06fDSkhsQva3bCBkesRh7g==\":1}";
            "browser.newtabpage.enhanced" = false;
            "browser.newtabpage.introShown" = true;
            "browser.newtabpage.pinned" = "[{\"url\":\"https://start.fedoraproject.org/\",\"title\":\"Fedora Project - Start Page\",\"baseDomain\":\"start.fedoraproject.org\"},{\"url\":\"https://amazon.com\",\"label\":\"@amazon\",\"searchTopSite\":true,\"baseDomain\":\"amazon.com\"},null,null,null,null,null,null,null,null,null,null,null,null,null,null,{\"url\":\"https://www.coingecko.com/en/\",\"label\":\"coingecko\"}]";
            "browser.newtabpage.storageVersion" = 1;
            "browser.pageActions.persistedActions" = "{\"version\":1,\"ids\":[\"bookmark\"],\"idsInUrlbar\":[\"bookmark\"],\"idsInUrlbarPreProton\":[\"bookmark\"]}";
            "browser.pagethumbnails.storage_version" = 3;
            "browser.protections_panel.infoMessage.seen" = true;
            "browser.proton.toolbar.version" = 3;
            "browser.region.update.updated" = 1628879112;
            "browser.rights.3.shown" = true;
            "browser.safebrowsing.appRepURL" = "";
            "browser.safebrowsing.blockedURIs.enabled" = false;
            "browser.safebrowsing.downloads.enabled" = false;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "browser.safebrowsing.downloads.remote.url" = "";
            "browser.safebrowsing.enabled" = false;
            "browser.safebrowsing.malware.enabled" = false;
            "browser.safebrowsing.phishing.enabled" = false;
            "browser.safebrowsing.provider.google4.lastupdatetime" = "1611666556287";
            "browser.safebrowsing.provider.google4.nextupdatetime" = "1611668360287";
            "browser.safebrowsing.provider.mozilla.lastupdatetime" = "1628974776035";
            "browser.safebrowsing.provider.mozilla.nextupdatetime" = "1628996376035";
            "browser.search.region" = "US";
            "browser.selfsupport.url" = "";
            "browser.sessionstore.upgradeBackup.latestBuildID" = "20210804102508";
            "browser.shell.didSkipDefaultBrowserCheckOnFirstRun" = true;
            "browser.shell.mostRecentDateSetAsDefault" = "1628971405";
            "browser.slowStartup.averageTime" = 0;
            "browser.slowStartup.samples" = 0;
            "browser.startup.homepage" = "about:newtab";
            "browser.startup.homepage_override.buildID" = "20210106153251";
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.startup.lastColdStartupCheck" = 1628971405;
            "browser.tabs.closeWindowWithLastTab" = false;
            "browser.tabs.crashReporting.sendReport" = false;
            "browser.tabs.drawInTitlebar" = true;
            "browser.tabs.warnOnClose" = false;
            "browser.theme.toolbar-theme" = 1;
            "browser.toolbars.bookmarks.visibility" = "never";
            "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"home-button\",\"urlbar-container\",\"downloads-button\",\"library-button\",\"sidebar-button\",\"fxa-toolbar-menu-button\",\"_e4a8a97b-f2ed-450b-b12d-ee082ba24781_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action\",\"chrome-gnome-shell_gnome_org-browser-action\",\"preferences-button\",\"_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action\",\"contact_lesspass_com-browser-action\",\"bypasspaywalls_bypasspaywalls-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"managed-bookmarks\",\"personal-bookmarks\"]},\"seen\":[\"developer-button\",\"_e4a8a97b-f2ed-450b-b12d-ee082ba24781_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action\",\"chrome-gnome-shell_gnome_org-browser-action\",\"_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action\",\"contact_lesspass_com-browser-action\",\"bypasspaywalls_bypasspaywalls-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"toolbar-menubar\",\"TabsToolbar\",\"PersonalToolbar\"],\"currentVersion\":17,\"newElementCount\":3}";
            "browser.uidensity" = 1;
            "browser.urlbar.placeholderName" = "Google";
            "browser.urlbar.resultBuckets" = "{\"children\":[{\"maxResultCount\":1,\"children\":[{\"group\":\"heuristicTest\"},{\"group\":\"heuristicExtension\"},{\"group\":\"heuristicSearchTip\"},{\"group\":\"heuristicOmnibox\"},{\"group\":\"heuristicUnifiedComplete\"},{\"group\":\"heuristicAutofill\"},{\"group\":\"heuristicTokenAliasEngine\"},{\"group\":\"heuristicFallback\"}]},{\"group\":\"extension\",\"maxResultCount\":5},{\"flexChildren\":true,\"children\":[{\"flexChildren\":true,\"children\":[{\"flex\":2,\"group\":\"formHistory\"},{\"flex\":4,\"group\":\"remoteSuggestion\"},{\"flex\":0,\"group\":\"tailSuggestion\"}],\"flex\":2},{\"group\":\"general\",\"flex\":1}]}]}";
            "browser.urlbar.tabToSearch.onboard.interactionsLeft" = 0;
            "browser.urlbar.tipShownCount.searchTip_onboard" = 4;
            "browser.urlbar.tipShownCount.tabToSearch" = 60;
            "browser.urlbar.trimURLs" = false;
            "datareporting.healthreport.service.enabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
            "datareporting.policy.dataSubmissionPolicyNotifiedTime" = "1604254605097";
            "device.sensors.enabled" = false;
            "device.sensors.motion.enabled" = false;
            "device.sensors.orientation.enabled" = false;
            "devtools.aboutdebugging.collapsibilities.otherWorker" = true;
            "devtools.aboutdebugging.collapsibilities.processes" = false;
            "devtools.debugger.end-panel-size" = 308;
            "devtools.debugger.pause-on-caught-exceptions" = false;
            "devtools.debugger.pending-selected-location" = "{\"sourceId\":\"source-https://cdn.frankspeech.com/resources/videojs/plugins/videojs-mux.js\",\"line\":8,\"column\":70324,\"sourceUrl\":\"\",\"url\":\"https://cdn.frankspeech.com/resources/videojs/plugins/videojs-mux.js\"}";
            "devtools.debugger.prefs-schema-version" = 11;
            "devtools.everOpened" = true;
            "devtools.inspector.activeSidebar" = "computedview";
            "devtools.netmonitor.columnsData" = "[{\"name\":\"status\",\"minWidth\":30,\"width\":6.63},{\"name\":\"method\",\"minWidth\":30,\"width\":6.63},{\"name\":\"domain\",\"minWidth\":30,\"width\":13.36},{\"name\":\"file\",\"minWidth\":30,\"width\":33.43},{\"name\":\"url\",\"minWidth\":30,\"width\":25},{\"name\":\"initiator\",\"minWidth\":30,\"width\":13.37},{\"name\":\"type\",\"minWidth\":30,\"width\":6.62},{\"name\":\"transferred\",\"minWidth\":30,\"width\":13.32},{\"name\":\"contentSize\",\"minWidth\":30,\"width\":6.63},{\"name\":\"waterfall\",\"minWidth\":150,\"width\":2.13}]";
            "devtools.netmonitor.msg.visibleColumns" = "[\"data\",\"time\"]";
            "devtools.netmonitor.panes-network-details-height" = 50;
            "devtools.netmonitor.panes-network-details-width" = 381;
            "devtools.responsive.html.displayedDeviceList" = "{\"added\":[\"Galaxy Note 9\",\"iPhone XS Max\"],\"removed\":[\"iPhone 6/7/8\",\"iPhone 6/7/8 Plus\",\"iPad\",\"Kindle Fire HDX\"]}";
            "devtools.responsive.reloadNotification.enabled" = false;
            "devtools.responsive.touchSimulation.enabled" = true;
            "devtools.responsive.userAgent" = "Mozilla/5.0 (Linux; Android 7.0; SM-G892A Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/67.0.3396.87 Mobile Safari/537.36";
            "devtools.responsive.viewport.height" = 740;
            "devtools.responsive.viewport.pixelRatio" = 4;
            "devtools.responsive.viewport.width" = 360;
            "devtools.selfxss.count" = 5;
            "devtools.toolbox.footer.height" = 393;
            "devtools.toolbox.selectedTool" = "jsdebugger";
            "devtools.toolbox.splitconsoleHeight" = 157;
            "devtools.toolsidebar-height.inspector" = 350;
            "devtools.toolsidebar-width.inspector" = 629;
            "devtools.toolsidebar-width.inspector.splitsidebar" = 350;
            "distribution.fedora.bookmarksProcessed" = true;
            "distribution.iniFile.exists.appversion" = "90.0.2";
            "distribution.iniFile.exists.value" = true;
            "doh-rollout.balrog-migration-done" = true;
            "doh-rollout.disable-heuristics" = true;
            "doh-rollout.doneFirstRun" = true;
            "doh-rollout.doorhanger-decision" = "UIDisabled";
            "doh-rollout.home-region" = "US";
            "doh-rollout.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
            "dom.battery.enabled" = false;
            "dom.event.clipboardevents.enabled" = false;
            "dom.forms.autocomplete.formautofill" = true;
            "dom.push.userAgentID" = "954dabcbb70042418d7cf08c2392513e";
            "dom.storage.next_gen" = true;
            "dom.storage.next_gen_auto_enabled_by_cause1" = true;
            "experiments.activeExperiment" = false;
            "experiments.enabled" = false;
            "experiments.manifest.uri" = "";
            "experiments.supported" = false;
            "extensions.activeThemeID" = "firefox-compact-light@mozilla.org";
            "extensions.blocklist.pingCountVersion" = -1;
            "extensions.databaseSchema" = 33;
            "extensions.formautofill.addresses.usage.hasEntry" = true;
            "extensions.formautofill.creditCards.used" = 3;
            "extensions.fxmonitor.firstAlertShown" = true;
            "extensions.getAddons.cache.enabled" = false;
            "extensions.getAddons.cache.lastUpdate" = 1611598680;
            "extensions.getAddons.databaseSchema" = 6;
            "extensions.getAddons.showPane" = false;
            "extensions.greasemonkey.stats.optedin" = false;
            "extensions.greasemonkey.stats.url" = "";
            "extensions.incognito.migrated" = true;
            "extensions.lastAppBuildId" = "20210804102508";
            "extensions.lastAppVersion" = "90.0.2";
            "extensions.lastPlatformVersion" = "90.0.2";
            "extensions.pendingOperations" = false;
            "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
            "extensions.pocket.enabled" = false;
            "extensions.pocket.settings.test.panelSignUp" = "control";
            "extensions.reset_default_search.runonce.1" = true;
            "extensions.reset_default_search.runonce.3" = true;
            "extensions.reset_default_search.runonce.reason" = "previousRun";
            "extensions.shield-recipe-client.api_url" = "";
            "extensions.shield-recipe-client.enabled" = false;
            "extensions.systemAddonSet" = "{\"schema\":1,\"directory\":\"{574c52ed-5c58-4670-acae-d7679c977655}\",\"addons\":{\"reset-search-defaults@mozilla.com\":{\"version\":\"2.1.0\"}}}";
            "extensions.ui.dictionary.hidden" = true;
            "extensions.ui.extension.hidden" = false;
            "extensions.ui.lastCategory" = "addons://list/extension";
            "extensions.ui.locale.hidden" = true;
            "extensions.ui.plugin.hidden" = false;
            "extensions.webcompat.enable_picture_in_picture_overrides" = true;
            "extensions.webcompat.enable_shims" = true;
            "extensions.webcompat.perform_injections" = true;
            "extensions.webcompat.perform_ua_overrides" = true;
            "extensions.webextensions.ExtensionStorageIDB.migrated.bypasspaywalls@bypasspaywalls" = true;
            "extensions.webextensions.ExtensionStorageIDB.migrated.chrome-gnome-shell@gnome.org" = true;
            "extensions.webextensions.ExtensionStorageIDB.migrated.screenshots@mozilla.org" = true;
            "extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net" = true;
            "extensions.webextensions.ExtensionStorageIDB.migrated.{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" = true;
            "extensions.webextensions.ExtensionStorageIDB.migrated.{d7742d87-e61d-4b78-b8a1-b469842139fa}" = true;
            "extensions.webextensions.uuids" = "{\"doh-rollout@mozilla.org\":\"a4345342-fb21-4042-9623-6adef94e0d8f\",\"formautofill@mozilla.org\":\"456a3f17-08a4-4255-9ba0-ff4c501defa6\",\"screenshots@mozilla.org\":\"405a9cda-7184-46e3-a035-d5c6ecc8af8e\",\"webcompat-reporter@mozilla.org\":\"0a89620d-aebb-42ee-a762-1425aabafb3f\",\"webcompat@mozilla.org\":\"ebae2e79-2050-49fa-a11f-5a42c596f4e8\",\"default-theme@mozilla.org\":\"0dd92f47-3062-4d37-9849-a9b60f1db8d3\",\"google@search.mozilla.org\":\"f763d05f-b528-40ab-9052-a91a05639f79\",\"amazondotcom@search.mozilla.org\":\"19db525b-46a7-4573-9920-c5ac043d0128\",\"wikipedia@search.mozilla.org\":\"f03e167a-98ae-4752-b525-c74e4258b357\",\"bing@search.mozilla.org\":\"974e6a0f-aff9-4b93-af0e-a2856c05b195\",\"ddg@search.mozilla.org\":\"5bc5a23e-67fd-445d-bfaf-743950cbd3ee\",\"ebay@search.mozilla.org\":\"08063d33-ae16-461f-b9c4-8ac642bcdc9d\",\"uBlock0@raymondhill.net\":\"73f46795-059f-4b73-ba59-42b82370269b\",\"{d7742d87-e61d-4b78-b8a1-b469842139fa}\":\"98196d44-5f18-4dee-8c86-9a9879c789fb\",\"chrome-gnome-shell@gnome.org\":\"879c2164-6812-4319-81ea-1ea6ca59e4ff\",\"{aecec67f-0d10-4fa7-b7c7-609a2db280cf}\":\"6d6383f6-79c9-43d9-ab58-1e9be7f3f962\",\"contact@lesspass.com\":\"bd6cc921-a2f1-41d7-ac7a-be99a2bec4f9\",\"postwoman-firefox@postwoman.io\":\"1a4452ce-546f-4643-9bc5-ff47ba24c1bc\",\"reset-search-defaults@mozilla.com\":\"1508b0e4-a399-409e-b57b-7a045c371f52\",\"firefox-compact-light@mozilla.org\":\"bdafb39d-a42f-4055-a23e-167c917a6b98\",\"bypasspaywalls@bypasspaywalls\":\"fbbca4d8-fa1a-48f8-ba2b-10c983e89eb7\",\"pictureinpicture@mozilla.org\":\"749aa204-ce0b-432c-bbd7-e43544519b4b\"}";
            "extensions.webservice.discoverURL" = "";
            "findbar.highlightAll" = true;
            "fission.experiment.max-origins.last-disqualified" = 0;
            "fission.experiment.max-origins.last-qualified" = 1614545915;
            "fission.experiment.max-origins.qualified" = true;
            "font.default.x-western" = "sans-serif";
            "font.internaluseonly.changed" = true;
            "font.minimum-size.x-western" = 14;
            "font.name.monospace.x-western" = "Droid Sans Mono";
            "font.name.sans-serif.x-western" = "Noto Sans";
            "font.name.serif.x-western" = "Noto Sans";
            "general.smoothScroll" = false;
            "identity.fxaccounts.toolbar.accessed" = true;
            "idle.lastDailyNotification" = 1628953689;
            "media.autoplay.enabled" = false;
            "media.gmp-manager.buildID" = "20210804102508";
            "media.gmp-manager.lastCheck" = 1628961042;
            "media.gmp.storage.version.observed" = 1;
            "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
            "network.IDN_show_punycode" = true;
            "network.allow-experiments" = false;
            "network.cookie.cookieBehavior" = 1;
            "network.cookie.lifetimePolicy" = 2;
            "network.dns.disablePrefetch" = true;
            "network.http.speculative-parallel-limit" = 0;
            "network.predictor.enabled" = false;
            "network.prefetch-next" = false;
            "network.proxy.socks" = "127.0.0.1";
            "network.proxy.socks_port" = 9123;
            "network.proxy.socks_remote_dns" = true;
            "network.proxy.type" = 0;
            "network.trr.blocklist_cleanup_done" = true;
            "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
            "pdfjs.enabledCache.state" = true;
            "pdfjs.migrationVersion" = 2;
            "places.database.lastMaintenance" = 1628352564;
            "places.history.expiration.transient_current_max_pages" = 152410;
            "pref.general.disable_button.default_browser" = false;
            "pref.privacy.disable_button.cookie_exceptions" = false;
            "pref.privacy.disable_button.tracking_protection_exceptions" = false;
            "pref.privacy.disable_button.view_passwords" = false;
            "pref.privacy.disable_button.view_passwords_exceptions" = false;
            "privacy.donottrackheader.enabled" = true;
            "privacy.firstparty.isolate" = true;
            "privacy.history.custom" = true;
            "privacy.purge_trackers.date_in_cookie_database" = "0";
            "privacy.purge_trackers.last_purge" = "1628953689053";
            "privacy.sanitize.pending" = "[{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]";
            "privacy.trackingprotection.cryptomining.enabled" = false;
            "privacy.trackingprotection.fingerprinting.enabled" = false;
            "privacy.trackingprotection.pbmode.enabled" = false;
            "security.remote_settings.crlite_filters.checked" = 1628971554;
            "security.remote_settings.intermediates.checked" = 1628971554;
            "security.sandbox.content.tempDirSuffix" = "94673579-56eb-43bf-ab8b-6964b1dc2ae4";
            "security.sandbox.plugin.tempDirSuffix" = "d7216f25-2bc4-4a02-9d02-bb879c2cce37";
            "services.blocklist.addons-mlbf.checked" = 1628971554;
            "services.blocklist.gfx.checked" = 1628971554;
            "services.blocklist.pinning.checked" = 1626529202;
            "services.blocklist.plugins.checked" = 1627299132;
            "services.settings.clock_skew_seconds" = 0;
            "services.settings.last_etag" = "\"1628948830700\"";
            "services.settings.last_update_seconds" = 1628971554;
            "services.settings.main.anti-tracking-url-decoration.last_check" = 1628971554;
            "services.settings.main.cfr-fxa.last_check" = 1628971554;
            "services.settings.main.cfr.last_check" = 1628971554;
            "services.settings.main.doh-config.last_check" = 1628971554;
            "services.settings.main.doh-providers.last_check" = 1628971554;
            "services.settings.main.fxmonitor-breaches.last_check" = 1628971554;
            "services.settings.main.hijack-blocklists.last_check" = 1628971554;
            "services.settings.main.language-dictionaries.last_check" = 1628971554;
            "services.settings.main.message-groups.last_check" = 1628971554;
            "services.settings.main.nimbus-desktop-experiments.last_check" = 1628971554;
            "services.settings.main.normandy-recipes-capabilities.last_check" = 1628971554;
            "services.settings.main.partitioning-exempt-urls.last_check" = 1628971554;
            "services.settings.main.password-recipes.last_check" = 1628971554;
            "services.settings.main.pioneer-study-addons-v1.last_check" = 1628971554;
            "services.settings.main.public-suffix-list.last_check" = 1628971554;
            "services.settings.main.search-config.last_check" = 1628971554;
            "services.settings.main.search-default-override-allowlist.last_check" = 1628971554;
            "services.settings.main.search-telemetry.last_check" = 1628971554;
            "services.settings.main.sites-classification.last_check" = 1628971554;
            "services.settings.main.tippytop.last_check" = 1628971554;
            "services.settings.main.top-sites.last_check" = 1628971554;
            "services.settings.main.url-classifier-skip-urls.last_check" = 1628971554;
            "services.settings.main.websites-with-shared-credential-backends.last_check" = 1628971554;
            "services.settings.main.whats-new-panel.last_check" = 1628971554;
            "services.settings.security.onecrl.checked" = 1628971554;
            "services.sync.clients.lastSync" = "0";
            "services.sync.declinedEngines" = "";
            "services.sync.engine.addresses.available" = true;
            "services.sync.globalScore" = 0;
            "services.sync.nextSync" = 0;
            "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" = false;
            "services.sync.tabs.lastSync" = "0";
            "signon.autofillForms" = false;
            "signon.generation.enabled" = false;
            "signon.usage.hasEntry" = true;
            "signon.usage.lastUsed" = 1608325317;
            "storage.vacuum.last.index" = 1;
            "storage.vacuum.last.places.sqlite" = 1628005623;
            "toolkit.scrollbox.verticalScrollDistance" = 10;
            "toolkit.startup.last_success" = 1628971403;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.cachedClientID" = "c0ffeec0-ffee-c0ff-eec0-ffeec0ffeec0";
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.pioneer-new-studies-available" = true;
            "toolkit.telemetry.previousBuildID" = "20210106153251";
            "toolkit.telemetry.prompted" = 2;
            "toolkit.telemetry.rejected" = true;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.server" = "";
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.unifiedIsOptIn" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "webgl.renderer-string-override" = " ";
            "webgl.vendor-string-override" = " ";
          };
        };
      };
    };
  };
}
