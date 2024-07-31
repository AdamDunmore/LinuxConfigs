{
    services.kanshi = {
        enable = true;
        profiles = {
            pc = {
                outputs = [
                    {
                        criteria = "LG Electronics 24EA53";
                        mode = "640x480";
                    }
    
                    {
                        criteria = "Microstep MSI G32CV DC3M022700075";
                    }
    
                    {
                        criteria = "AOC 2460G5 0x0002FE34";
                    }
                ];
            };

            any = {
                outputs = [
                    {
                        criteria = "*";
                    }
                ];
            };
        };
    };
}
