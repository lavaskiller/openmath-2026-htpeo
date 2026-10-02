import re
s = open("jsp_scan3.py").read()
a = s.index("KW = {"); b = s.index("pat = {")
kw = r'''KW = {
 "508seven": r"AtMostSeven|Isbell|[Hh]exagonal (tiling|colou?ring)|seven.colou?r|7.colou?ring of the plane|chromaticNumber[^\n]{0,60}≤ 7",
 "649tong": r"\bTong\b|variants\.tong|erdos_649|[Ee]rdos649|maxPrimeFac",
 "942limsup": r"variants\.limsup|erdos_942|[Pp]owerful[^\n]{0,80}limsup|limsup[^\n]{0,80}[Pp]owerful|squarefull",
 "617": r"r_eq_3|erdos_617|[Ee]rdos617|balanced colou?ring|Erd[oő]s.Gy[aá]rf[aá]s",
 "1136": r"variants\.mueller|muellerSet|M[uü]e?ller",
}
'''
s = s[:a] + kw + s[b:]
s = s.replace("jsp_scan3.json", "jsp_scan4.json").replace("jsp_scan3.py", "jsp_scan4.py")
open("jsp_scan4.py", "w").write(s)
