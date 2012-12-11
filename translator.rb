H248_HASH = Hash["A", "Add",
"AT", "Audit",
"AC", "AuditCapability",
"AV", "AuditValue",
"AU", "Authentication",
"BW", "Bothway",
"BR", "Brief",
"BF", "Buffer",
"C", "Context",
"CA", "ContextAudit",
"DM", "DigitMap",
"DC", "Disconnected",
"DL", "Delay",
"DR", "Duration",
"EM", "Embed",
"EG", "Emergency",
"ER", "Error",
"EB", "EventBuffer",
"E", "Events",
"FL", "Failover",
"FO", "Forced",
"GR", "Graceful",
"HO", "HandOff",
"IA", "ImmAckRequired",
"IN", "Inactive",
"IS", "Isolate",
"IV", "InService",
"IBE", "IntByEvent",
"IBS", "IntBySigDescr",
"KA", "KeepActive",
"L", "Local",
"O", "LocalControl",
"SP", "LockStep",
"LB", "Loopback",
"M", "Media",
"!", "MEGACO",
"MT", "Method",
"MG", "MgcIdToTry",
"MO", "Mode",
"MF", "Modify",
"MD", "Modem",
"MV", "Move",
"MX", "Mux",
"N", "Notify",
"NC", "NotifyCompletion",
"OE", "ObservedEvents",
"OW", "Oneway",
"OO", "OnOff",
"OR", "OtherReason",
"OS", "OutOfService",
"PG", "Packages",
"PN", "Pending",
"PR", "Priority",
"PF", "Profile",
"RE", "Reason",
"RC", "ReceiveOnly",
"P", "Reply",
"RS", "Restart",
"R", "Remote",
"RG", "ReservedGroup",
"RV", "ReservedValue",
"SO", "SendOnly",
"SR", "SendReceive",
"SV", "Services",
"SI", "ServiceStates",
"SC", "ServiceChange",
"AD", "ServiceChangeAddress",
"SL", "SignalList",
"SG", "Signals",
"SY", "SignalType",
"SA", "Statistics",
"ST", "Stream",
"S", "Subtract",
"SN", "SynchISDN",
"TS", "TerminationState",
"TE", "Test",
"TO", "TimeOut",
"TP", "Topology",
"T", "Transaction",
"K", "TransactionResponseAck",
"V", "Version",
"O-", "Optional-",
]

class H248_Translator
    def translate(h248_string)
        result_string = ""
        h248_string.split("\n").each do |line|
            matchdata = /^([OW]-)?([OW]-)?([a-zA-Z!]+)/.match(line)
            result_line = ""
            matchdata.captures.each do |item|
                if not item.nil?
                    result_line << convert(item)
                end
            end
            result_line << matchdata.post_match
            result_string << result_line
            result_string << "\n"
        end unless h248_string.split("\n").nil?
        return result_string
    end

    def convert(string)
        if H248_HASH.has_key?(string)
            return H248_HASH[string]
        else
            return string
        end
    end
end

ht = H248_Translator.new
h248_input = ""
while 1
    my_input = gets
    if my_input.chomp == ""
        puts ht.translate(h248_input)
        h248_input = ""
    else
        h248_input = h248_input + my_input
    end
end

