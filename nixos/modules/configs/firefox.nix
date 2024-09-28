let 
    defaults = {

    };
in
{
    programs.firefox = {
        enable = true;

        profiles.adam = {
            id = 0;
            isDefault = true;
            containers = {
                containersForce = true;
                main = {
                    color = "blue";
                    id = 0;
                    icon = "circle";
                    name = "Main";
                };

                university = {
                    color = "red";
                    id = 1;
                    icon = "chill";
                    name = "University";
                };
            };
        };
    };
}
