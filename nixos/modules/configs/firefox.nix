{
    programs.firefox = {
        enable = true;
        # languagePacks = [
        #     "en-GB"
        # ];
        profiles = {
            # containersForce = true;
            adam = {
                isDefault = true;
                search = {
                    engines = {
                        "Ecotia" = {
                            urls = [
                                "https://www.ecosia.org/search?q={searchTerms}"
                            ];
                            # iconUpdateURL = "";
                            updateInterval = 24 * 60 * 60 * 1000 * 7;
                            definedAliases = [ "@ec" ];
                        };
                    };
                };
                containers = {
                    main = {
                        id = 0;
                        color = "blue";
                        name = "Main";
                    };
                    university = {
                        id = 1;
                        color = "red";
                        name = "University";
                    };
                };
            };
        };
    };
}
