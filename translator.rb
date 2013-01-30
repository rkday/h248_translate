#Copyright (c) 2012-2013, Robert K. Day
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met: 
#
#1. Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer. 
#2. Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution. 
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
#ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


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
"W-", "Wildcarded-",
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

