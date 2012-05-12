#!/usr/bin/lua

require("socket");

function main ()
        local error_msg = m.getvar("tx.msg", "none");

        if (error_msg ~= nil) then
                local status, err =  pcall(send, error_msg)
        end

        if (err ~= nil) then
                m.log(2, "StatsD Error: " .. err);
        end
end

function send(data)
        local host = "127.0.0.1";
        local port = 8125;
        local prefix = "applications.apache.modsecurity."

        local send_data = prefix .. data .. ":1|c"

        udp_sock = socket.udp();
        udp_sock:sendto(send_data, host, port)
end
