#! /bin/bash

sudo cat << EOF > /etc/polkit-1/rules.d/10-tailscaled.rules
polkit.addRule(function(action, subject) {
        if(action.id.indexOf == "org.freedesktop.resolve1." &&
                subject.user == "tailscaled") {                           
                        polkit.log("action=" + action + " subject=" + subject);
                        return polkit.Result.YES;                         
        }                           
});                                                                    
EOF
