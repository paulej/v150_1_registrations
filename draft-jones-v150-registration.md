%%%

    #
    # Registration of V.150.1 Media Types and SDP Parameters
    # (draft-jones-v150-registration)
    #
    # Generation tool chain:
    #   mmark (https://github.com/mmarkdown/mmark/)
    #   xml2rfc (http://xml2rfc.ietf.org/)
    #

    Title = "IANA Registration of Media Types and SDP Parameters in Recommendation ITU-T V.150.1"
    abbrev = "V.150.1 Media Types and SDP Parameters"
    ipr= "trust200902"
    area = "Internet"
    workgroup = ""
    keyword = ["SDP", "Media Types", "V.150.1"]

    [seriesInfo]
    status = "standard"
    name = "Internet-Draft"
    value = "draft-jones-v150-registration-00"
    stream = "IETF"

    [pi]
    subcompact = "yes"

    [[author]]
    initials = "P."
    surname = "Jones"
    fullname = "Paul E. Jones"
    organization = "Cisco Systems, Inc."
    abbrev = "Cisco"
      [author.address]
      email = "paulej@packetizer.com"
      phone = "+1 919 476 2048"
      [author.address.postal]
      street = "7025 Kit Creek Rd."
      city = "Research Triangle Park"
      region = "North Carolina"
      code = "27709"
      country = "USA"

    [[author]]
    initials = "M."
    surname = "Ross"
    fullname = "Michael Ross"
    organization = "TBD"
    abbrev = "TBD"
      [author.address]
      email = "TBD"

    #
    # Revision History
    #   00 - Initial draft.
    #

%%%

.# Abstract

This document defines a framework for the IANA registration of Media Types and
SDP parameters defined in Recommendation ITU-T V.150.1.  For SDP parameters,
it does not repeat the details of syntax and semantics found in the ITU
recommendation. For the Media Types, it provides RFC 6838-compliant Media
Type definitions which refer to Recommendation ITU-T V.150.1 for detailed
format description.

{mainmatter}

# Introduction

There is a need to register Recommendation ITU-T V.150.1 parameters with
IANA. These include (i) SDP parameters,  and (ii) media types. The IANA
registration of mesia types in the IETF tree requires an RFC approved by
the IESG.  This document is meant to fulfill that role.

Recommendation ITU-T V.150.1 standardizes, in a comprehensive manner, the
encapsulation of modem signals within IP. This includes both modem passthrough
and modem relay operation.

# Overview of Parameters to be registered

The following parameters defined in Recommendation ITU-T V.150.1 need to be
registered with IANA:

  1. New Media Types: audio/v150mr and audio/v150fw. These indicate media
     formats defined, in Recommendation ITU-T V.150.1 , for use in the modem-
     over-IP context. Media Type registration applications based on RFC 6838
     [@RFC6838] are in Section 4. These refer to Recommendation ITU-T V.150.1
     for detailed format descriptions and semantics.

  2. New SDP parameters (Section 3). These include a new transport protocol
     (udpsprt, section 3.1) and several new SDP attributes (Section 3.2).
     Precise details of their syntax and semantics, found in Recommendation
     ITU-T V.150.1, are not repeated.

# Conventions Used In This Document

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**",
"**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**",
"**MAY**", and "**OPTIONAL**" in this document are to be interpreted as
described in [@!RFC2119][@!RFC8174] when, and only when, they appear in
all capitals, as shown here.

# Registration of new SDP parameters

## Registration of the "udpsprt" transport protocol

The "udpsprt" (Simple Packet Relay Transport over UDP) protocol should be
registered as a value of the SDP field "proto", referring to the transport
protocol.

Details of the "udpsprt" (Simple Packet Relay Transport over UDP) protocol
are found in Recommendation ITU-T V.150.1 [@!ITU-T-V.150.1]. This is a
reliable protocol that can be used to efficiently guarantee packet delivery
in an IP network that is prone to packet loss.

## Registration of new SDP attributes

New SDP attributes defined in Recommendation ITU-T V.150.1 should be
registered as values of the SDP field "att-field".  Those attributes are:

  1. sprtparm, a list of parameters qualifying the "udpsprt" protocol.
  2. sprtmap, which dynamically defines a numerical identifier for modem relay
     packets.
  3. vndpar (vendor parameters), used to declare vendor-specific parameters.

The SDP attribute "gpmd" (general-purpose media descriptor) is addressed
elsewhere [@I-D.rajeshkumar-mmusic-gpmd]. This attribute is used extensively
in Recommendation ITU-T V.150.1 systems.

# Registration of Media Types

## Registration of the audio/v150mr Media type

This media type represents the modem relay packet format as defined in
Recommendation ITU-T V.150.1 recommendation. Hence the suffix "mr"
(modem relay).

### Media type name

audio

### Media subtype name

v150mr

### Required parameters

mr: the type of modem relay, from the set "0" (ITU-T V.8-compatible
modem relay) and "1" (universal modem relay).

mg: the type of media gateway, from the set "0" (No Transcompression),
"1" (Single Transcompression) and "2" (Double Transcompression.

CDSCselect: Call discrimination mode selection, from the set 1
("audio (RFC 2833)"), 2 ("VBD-preferred"), 3 (Mixed).

mrmods: This parameter lists supported modulation types.  These are
listed as one or more comma-separated elements, where each
element is either a single integer or two integers separated
by a hyphen. No white space is allowed. The integers, which
designate modulation types are from the set "1" (V.34
duplex), "2" (V.34 Half-duplex), "3" (V.32bis/V.32), "4"
(V.22bis/V.22), "5" (V.17), "6" (V.29 half- duplex), "7"
(V.27 ter), "8" (V.26 ter), "9" (V.26bis), "10" (V.23
duplex), "11" (V.23 half duplex), "12" (V.21), "13" (V.90
analog), "14" (V.90 digital), "15" (V.91), "16" (V.92 analog)
and "17" (V.92 digital).

jmdelay: indicates support of  JM delay procedures. Permissible values
are "yes" and "no".

### Optional parameters

versn: Composite representation of the version of the ITU-T
V.150-series Recommendation used. Dotted representation, x.y,
where the integer "x" is the suffix in the number of the
controlling Recommendation ("1" for ITU-T V.150.1), and the
integer "y" is the version of this Recommendation ("2" for the
version 2 of Recommendation ITU-T V.150.1).  The default is
fixed or configured for the Gateway or endpoint.  Declaration
of a value of this parameter implies backward compatibility
with earlier versions (values of "y") and document suffixes
(values of "x").

txalgs: This parameter lists supported optional transcompression
algorithms. Not listed is  ITU-T V.42bis, which is mandatory.
This list consists of  one or more comma-separated elements.
Each element can either be a single integer or two integers
separated by a hyphen. No white space is allowed. The
integers, which  designate transcompression algorithms are
from the set "1" (ITU-T V.44), "2" (MNP5). If this parameter
is omitted, ITU-T V.44 and MNP5 are not supported.

V42bNumCodewords: Proposed number of ITU-T V.42bis code words. This
is an integer in the range 512 to 65535, with a
default of 1024.

v42bMaxStringLength: Maximum ITU-T V.42bis string size, range
6 to 250. The default, when omitted, is 32.

v44NumTxCodewords: Proposed number of ITU-T V.44 transmitter code
words.  This is an integer in the range 256 to
65535, with a default of 1024.

v44NumRxCodewords: Proposed number of ITU-T V.44 receiver code words.
This is an integer in the range 256 to 65535, with
a default of 1024.

v44MaxTxStringLength: Maximum ITU-T V.44 transmitter string size,
range 32 to 255. The default, when omitted, is 64.

v44MaxRxStringLength: Maximum ITU-T V.44 receiver string size, range
32 to 255. The default, when omitted, is 64.

V44LenTxHistory: Proposed size of the ITU-T V.44 transmitter history,
range 512 to 65535. The default, when omitted, is 3072.

V44LenRxHistory: Proposed size of the ITU-T V.44 receiver history,
range 512 to 65535. The default, when omitted, is 3072.

TCXpreference: When two double transcompression (D-TCX) gateways are
connected, this parameter indicates preference for the
initial transcompression mode. Possible values are 1
("single") and 2 ("double"), with 1 as the default.


### Encoding considerations

The  media type audio/v150mr uses the "udpsprt" (Simple Packet Relay
Transport over UDP) reliable transport protocol as defined in Recommendation
ITU-T V.150.1. As such, it consists of packets of binary data.

### Security considerations

The privacy and integrity of the data transmitted via
Recommendation ITU-T V.150.1 modem relay must be ensured at the
application level by means such as encryption. The ITU-T V.150.1
modem relay protocol does not hinder such end-to-end data
protection. Nor does it provide any additional, inbuilt safeguards
that can be used in the absence of end-to-end, application-level
data security. The transcompression and other algorithms  used
in ITU-T V.150.1 modem relay are published in various standards and
can be implemented by a resourceful attacker.

Likewise, ITU-T V.150.1 modem relay procedures do not address session
authentication, which must be handled end-to-end by client and server
authentication applications. Authentication is out of the scope of a
bearer-level protocol such as ITU-T V.150.1 modem relay.

Resource usage by a modem relay session may be monitored to prevent
denial of service attacks. The resource utilization of modem relay
sessions does not exhibit such non-uniformity so as to preclude such
resource limiting.

The media type contains no executable content that affects sessions or
session legs other than the ones in which the requester is a
participant. For these session legs, executable content in the form of
modem relay control messages is well within the normal prerogatives of
the requester.

Like other  encodings with open-ended content, the ITU-T V.150.1
modem relay format may be abused by hiding data using steganography.
However, due to its more limited context, it is unlikely that it
will be preferred for such misuse vis-a-vis other audio and video
encodings.

### Interoperability considerations

Interoperability is limited to endpoints or gateways that implement
the mandatory parts of Recommendation ITU-T V.150.1.  Backward
compatibility will be maintained between all versions of the
Recommendation.

### Published specification

Recommendation ITU-T V.150.1 was approved on January 13, 2003.

### Applications which use this media

Endpoints and media gateways that interface with V-series modems on
one end, and with an IP network on the other end. In this case, the
on-ramp gateway does not support full modem termination which would
have allowed forwarding via a higher-layer protocol.

### Additional information

1. Magic number(s): N/A
2. File extension(s): N/A
3. Macintosh file type code: N/A

## Registration of the audio/v150fw Media type

This media type represents the format of messages used to define the
contextual framework of information transfer operation as defined in
Recommendation ITU-T V.150.1, hence the suffix "fw" (framework).

### Media type name

audio

### Media subtype name

v150fw

### Required parameters

None.

### Optional parameters

events: The "events" parameter lists the framework event messages
supported by the media gateway or endpoint. Events are listed
as one or more comma-separated elements. Each element can
either be a single integer, or two integers separated by a
hyphen.  The latter indicates a range of integers. No white
space is allowed in the representation.  The integers, which
identify event types are from the set "0" (null), "1"
(initial audio), "2" (voice band data), "3" (modem relay),
"4" (text relay), "5" (fax relay). When omitted, the default
is 0-4.

expack: indicates whether explicit framework message acknowledgement
procedures, as defined in Recommendation ITU-T V.150.1 are
enabled or not. Both sides must enable these procedures in
order for them to be used. Permissible values are "yes" and
"no".

### Encoding considerations

Like all other Recommendation ITU-T V.150.1 media formats except
modem relay, the media type audio/v150fw uses the RTP protocol.
As such, it consists of packets of binary data. The RTP payload is
defined in Recommendation ITU-T V.150.1.

### Security considerations

As with other RTP formats, it is possible to use IPSEC to ensure the
authenticity, integrity and privacy of this media format. Since this
media format is uncompressed, there is no potential conflict between
compression and encryption. Many applications use modem relay between
trusted network equipment and, as such, may forego the use of IPSEC.
When used with equipment in untrusted areas, the impact of the V.150
framework messages is limited to one session. Hence, any exposure
from not encrypting this media format is limited.

Resource usage by V.150 framework messages may be monitored to
prevent denial of service attacks. Since the resource utilization of
these messages is minimal, resource limiting is not precluded.

The media type contains no executable content that affects sessions
or session legs other than the ones in which the requester is a
participant. For these session legs, executable content in the form
of V.150 framework messages is well within the normal prerogatives of
the requester.

Since the content associated with this media type is well-defined and
not open-ended, it is not vulnerable to hiding data using
steganography.

### Interoperability considerations

Interoperability is limited to endpoints or gateways that implement
the mandatory parts of Recommendation ITU-T V.150.1. Backward
compatibility will be maintained between all versions of this
recommendation.

### Published specification

Recommendation ITU-T V.150.1 was approved on January 13, 2003.

### Applications which use this media

Endpoints and media gateways that interface with V-series modems on
one end, and with an IP network on the other end. In this case, the
on-ramp gateway does not support full modem termination which would
have allowed forwarding via a higher-layer protocol.

### Additional information

1. Magic number(s): N/A
2. File extension(s): N/A
3. Macintosh file type code: N/A

# IANA Considerations

The entirety of this document is for IANA review and is limited to such
information as pertinent to the IANA registration of media types and SDP
parameters. Details found in Recommendation ITU-T V.150.1 are not repeated,
except as necessitated by media type registration rules [@!RFC6838].

# Security Considerations

This document does not impose any security considerations of its own, apart
from the security considerations associated with each media type documented
as a part of the registration template.

Security considerations for SDP parameters defined in this document are
unchanged from RFC 8866 [@!RFC8866].

# Acknowledgments

The ITU-T SG16 team led by Keith Chu, Rapporteur for the modem-over-IP
Question (Q11).  This team included members of the TIA TR.30.1 modem-over-IP
standards group, which was chaired by Les Brown in the past and is currently
chaired by Keith Chu. TIA TR.30.1 reports to the TIA TR.30 organization, which
is chaired by Fred Lucas.

Detailed review of and indispensable contribution towards of the
ITU-T V.150.1 SDP definition by Flemming Andreasen, Bill Foster and Dave Oran.

In addition, several people have contributed to the creation of this document,
including Rajesh Kumar (original primary author of this document), Jim Renkel,
Michael Nicholas, Herb Wildfeuer, Adrian Zakrzewski, Frank Chen,
Mehryar Garakani, Alex Urquizo, Nate Melhorn, Ken Jones, Daniel DeLiberato,
Hisham Abdelhamid, Mohamed Mostafa, and John Malone.

{backmatter}

<reference anchor='ITU-T-V.150.1'>
 <front>
    <title>Recommendation ITU-T V.150.1: Modem-over-IP networks: Procedures for the end-to-end connection of V-series DCEs</title>
    <author fullname='ITU-T'>
      <organization/>
    </author>
    <date year='2003' month='January' day='13'/>
 </front>
</reference>
