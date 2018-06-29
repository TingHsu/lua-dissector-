do
	--Create a new dissector 
	local PROTO_xxx = Proto("xxx","IEEExxx Protocol")
        --print('~~~~~~~~~')

	--IEEE 802.11ah QoS Data
	local f_xxx_Type 				= ProtoField.bytes("xxx.Type","Type")
	local f_xxx_FrameControlField		= ProtoField.bytes("xxx.FrameControlField","FrameControlField")
	--local f_xxx_Duration			= ProtoField.bytes("xxx.Duration","Duration")
	local f_xxx_ReceiverAddress			= ProtoField.bytes("xxx.ReceiverAddress","ReceiverAddress")
	local f_xxx_DestinationAddress		= ProtoField.bytes("xxx.DestinationAddress","DestinationAddress")
	local f_xxx_TransmitterAddress		= ProtoField.bytes("xxx.TransmitterAddress","TransmitterAddress")
	local f_xxx_SourceAddress			= ProtoField.bytes("xxx.SourceAddress","SourceAddress")
	local f_xxx_BSSID				= ProtoField.bytes("xxx.BSSID","BSSID" )
	local f_xxx_StaAddress			= ProtoField.bytes("xxx.StaAddress","StaAddress")
	--local f_xxx_FragmentNumber		= ProtoField.bytes("xxx.FragmentNumber","FragmentNumber")
	--local f_xxx_SequenceNumber		= ProtoField.bytes("xxx.SequenceNumber","SequenceNumber")
	local f_xxx_QoSControl			= ProtoField.bytes("xxx.QoSControl","QoSControl")
	
	local f_xxx_LogicLinkControl		= ProtoField.bytes("xxx.LogicLinkControl","LogicLinkControl")
	
	--Internet Protocol Version 4 
	local f_xxx_DifferentiatedServicesField     = ProtoField.bytes("xxx.DifferentiatedServicesField","DifferentiatedServicesField")
	local f_xxx_TotalLength			= ProtoField.bytes("xxx.TotalLength","TotalLength")
	local f_xxx_Identification			= ProtoField.bytes("xxx.Identification","Identification")
	local f_xxx_Flags				= ProtoField.bytes("xxx.Flags","Flags")
	local f_xxx_FragmentOffest			= ProtoField.bytes("xxx.FragmentOffest","FragmentOffest")
	local f_xxx_TimeToLive			= ProtoField.bytes("xxx.TimeToLive","TimeToLive")
	local f_xxx_Protocol			= ProtoField.bytes("xxx.Protocol","Protocol")
	local f_xxx_HeaderChecksum			= ProtoField.bytes("xxx.HeaderChecksum","HeaderChecksum")
	local f_xxx_Source				= ProtoField.bytes("xxx.Source","Source")
	local f_xxx_Destination			= ProtoField.bytes("xxx.Destination","Destination")
	
	--802.11ah Protocol
	local f_xxx_SourcePort			= ProtoField.bytes("xxx.SourcePort","SourcePort")
	local f_xxx_DestinationPort			= ProtoField.bytes("xxx.DestinationPort","DestinationPort")
	local f_xxx_Length				= ProtoField.bytes("xxx.Length","Length")
	
	
	PROTO_xxx.fields={f_xxx_Type,f_xxx_FrameControlField, f_xxx_Duration, f_xxx_ReceiverAddress, f_xxx_DestinationAddress, f_xxx_TransmitterAddress, f_xxx_SourceAddress, f_xxx_BSSID, f_xxx_StaAddress, f_xxx_FragmentNumber, f_xxx_SequenceNumber, f_xxx_QoSControl, f_xxx_LogicLinkControl, f_xxx_DifferentiatedServicesField, f_xxx_TotalLength, f_xxx_Identification, f_xxx_Flags, f_xxx_FragmentOffest, f_xxx_TimeToLive, f_xxx_Protocol, f_xxx_HeaderChecksum, f_xxx_Source, f_xxx_Destination, f_xxx_SourcePort, f_xxx_DestinationPort, f_xxx_Length}

	--The Dissector function
	function PROTO_xxx.dissector (buffer,pinfo,tree)
		length = buffer:len()
		if length == 0 then return end


		--show protocol name in protocol column
		pinfo.cols.protocol = PROTO_xxx.name
	
		local subtree = tree:add(xxx, buffer(), "xxx Protocol Data")
	
		--dissect field one by one , and add to protocol tree
		
		subtree:add_le(Type,buffer(0,1))
		subtree:add_le(FrameControlField,buffer(0,2))
		subtree:add_le(Duration,buffer(3,4))
		subtree:add_le(ReceiverAddress,buffer(5,10))
		subtree:add_le(DestinationAddress,buffer(17,22))
		subtree:add_le(TransmitterAddress,buffer(11,16))
		subtree:add_le(SourceAddress,buffer(11,16))
		subtree:add_le(BSSID,buffer(5,10))
		subtree:add_le(StaAddress,buffer(11,16))	
		subtree:add_le(FragmentNumber,buffer(23,24))
		subtree:add_le(SequenceNumber,buffer(23,24))
		subtree:add_le(QoSControl,buffer(25,26))
		subtree:add_le(LogicalLinkControl,buffer(27,34))	
		subtree:add_le(version,buffer(34,35))
		subtree:add_le(HeaderLength,buffer(34,35))
		subtree:add_le(DifferentiatedServicesField,buffer(35,36))
		subtree:add_le(TotalLength,buffer(37,38))
		subtree:add_le(Identification,buffer(39,40))
		subtree:add_le(Flags,buffer(41,41))
		subtree:add_le(FragmentOffset,buffer(41,42))
		subtree:add_le(TimeToLive,buffer(43,43))
		subtree:add_le(Protocol,buffer(44,44))
		subtree:add_le(HeaderChecksum,buffer(45,46))
		subtree:add_le(Source,buffer(47,50))
		subtree:add_le(Destination,buffer(51,54))
		subtree:add_le(SourcePort,buffer(55,56))
		subtree:add_le(DestinationPort,buffer(57,58))
		subtree:add_le(Length,buffer(59,60))
	
	
	
	end	





local udp_port = DissectorTable.get("udp.port")
udp_port:add(1000,PROTO_xxx)
end
