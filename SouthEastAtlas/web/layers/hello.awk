#!/usr/bin/awk -f
BEGIN { 
        arrRed[1]="Jan";
        arrRed[2]="Feb";
        arrRed[3]="Mar";
        arrRed[4]="Apr";
        arrRed[5]="May";
        arrRed[6]="Jun";
        arrRed[7]="Jul";
        arrRed[8]="Aug";
        arrRed[9]="Sep";
        arrRed[10]="Oct";
        arrRed[11]="Nov";
        arrRed[12]="Dec";

        arrEng[1]="January";
        arrEng[2]="February";
        arrEng[3]="March";
        arrEng[4]="April";
        arrEng[5]="May";
        arrEng[6]="June";
        arrEng[7]="July";
        arrEng[8]="August";
        arrEng[9]="September";
        arrEng[10]="October";
        arrEng[11]="November";
        arrEng[12]="December";

        arrEsp[1]="Enero";
        arrEsp[2]="Febrero";
        arrEsp[3]="Marzo";
        arrEsp[4]="Abril";
        arrEsp[5]="Mayo";
        arrEsp[6]="Junio";
        arrEsp[7]="Julio";
        arrEsp[8]="Agosto";
        arrEsp[9]="Septiembre";
        arrEsp[10]="Octubre";
        arrEsp[11]="Noviembre";
        arrEsp[12]="Diciembre"; 
    }
{
    # It will create 12 months for each line
    print $0;
    line=$0
    sopas[1]="no chinguen"
    for(i=1; i <= 12; i++){
        gsub("RED",arrRed[i],line)
        gsub("ENG",arrEng[i],line)
        gsub("ESP",arrEsp[i],line)
        print line
        line=$0
    }
}
END{}
