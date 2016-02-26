import QtQuick 2.0
import MuseScore 1.0
import MuseScore 1.0 as Ms

MuseScore {
      onRun: {
            var seg = curScore.firstSegment();
            curScore.startCmd();
            while (seg) {
                  for (var i = seg.annotations.length; i--; ) {
                        if (seg.annotations[i].type === Element.STAFF_TEXT) {
                              if (seg.annotations[i].textStyleType === TextStyleType.SYSTEM) {
                                    seg.annotations[i].textStyleType = TextStyleType.FIGURED_BASS;
                              }
                              else if (seg.annotations[i].textStyleType === TextStyleType.TECHNIQUE) {
                                    seg.annotations[i].textStyleType = TextStyleType.STRING_NUMBER;
                              }
                        }
                  }
                  seg = seg.next;
            }
            curScore.endCmd();
            Qt.quit();
            }
      }
