modsecurity-statsd
==================

StatsD LUA Script for ModSecurity

What it does
==================
This Lua script will send a message to a StatsD server every time ModSecurity logs a matched rule. I have not verified this on any installations other than my own and I use Anomaly based logging for mine. I did not do a full StatsD implementation since it seemed unnecessary for what this script is going to do. All that it can do as of right now is increment one stat at a time by 1.

Requirements
==================
1. Obviously an Apache configured with Mod-Security

Configuration
==================
1. Edit the host, port, and prefix variables in statsd.lua to suit your needs

Installation
==================
1. Add a rule to your ModSecurity config that looks like ...

   SecRuleScript /opt/modsecurity/etc/lua/statsd.lua "phase:5,t:none,pass"

2. Move statsd.lua to /opt/modsecurity/etc/lua/statsd.lua  (or wherever you want)
3. Restart Apache
