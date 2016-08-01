#include <File.au3>
#include <Array.au3>

Local $aArray = _FileListToArrayRec("Release\android-10\system", "*", 1, 1)
_ArrayDelete($aArray, 0)
Local $aNewArray = _FileListToArrayRec("Release\android-15\system", "*", 1, 1)
_ArrayDelete($aNewArray, 0)
_ArrayConcatenate($aArray, $aNewArray)
Local $aNewArray = _FileListToArrayRec("Release\android-17\system", "*", 1, 1)
_ArrayDelete($aNewArray, 0)
_ArrayConcatenate($aArray, $aNewArray)
Local $aNewArray = _FileListToArrayRec("Release\android-20\system", "*", 1, 1)
_ArrayDelete($aNewArray, 0)
_ArrayConcatenate($aArray, $aNewArray)
Local $aArrayUnique = _ArrayUnique($aArray)
_ArraySort($aArrayUnique)
FileDelete("gapps.lst")
For $i = 1 To $aArrayUnique[0]
	FileWriteLine("gapps.lst", "/system/" & StringReplace($aArrayUnique[$i], "\", "/") & @LF)
	$sExt = StringRight("/system/" & StringReplace($aArrayUnique[$i], "\", "/"), 3)
	If $sExt = "apk" Or $sExt = "jar" Then FileWriteLine("gapps.lst", StringTrimRight("/system/" & StringReplace($aArrayUnique[$i], "\", "/"), 3) & "odex" & @LF)
Next

_ArrayDisplay($aArrayUnique)
