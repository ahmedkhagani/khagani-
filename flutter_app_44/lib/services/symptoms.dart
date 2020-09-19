class disease{
  String name;
  String sym1;
  String sym2;
  String sym3;
  String sym4;
  String rf1;
  String rf2;
  String rf3;
  String rf4;
  disease(this.name,this.sym1,this.sym2,this.sym3,this.sym4,this.rf1,this.rf2,this.rf3,this.rf4);
}
main(){
  // heart burn may be removed
  var achal=disease('achalasia','dysphagia','odynophagia','heartburn','null','null','null','null','null');
  var esospa=disease('diffuse esophageal spasm','dysphagia','odynophagis','heartburn','null','null','null','null','null');
  var nutcrak=disease('nutcraker esophagus','dysphagia','odynophagia','heartburn','null','null','null','null','null');
  var diver=disease('diverticulae','dysphagia','odynophagia','heartburn','null','null','null','null','null');
  var esoring=disease('esophagial rings','dysphagia','odynophagia','null','null','null','null','null','null');
  //GERD will be left as ACS
  // peptic ulcer and pancreatitis to be seen

  var gasent=disease('gastroenteritis','watery diarrhea','mucousy diarrhea','bloody diarrhea','abdominal pain','null','null','null','null');
  var ibd=disease('indflammatory bowel disease','bloody diarrhea','mucousy diarrhea','abdominal pain','vomiting','weight loss','tenesmus','null','null');
  var sprue=disease('tropical sprue','watery diahrrea','weight loss','null','null','null','null','null','null');
  var bliloop=disease('small bowel bacovergrowth or blind loop syndrome','watery diarrhea','mucousy diarrhea','null','null','null','null','null','null');
  var sbs=disease('short bowel syndrome','watery diarrhea','mucousy diarrhea','weight loss','null','null','null','null','null');
  // ple is overlappped with other conditions
  var ple=disease('protein losing enteropathy','watery diarrhea','bilaterl leg edema','null','null','null','null','null','null');
  var ibs=disease('irritable bowel syndrome','watery diarrhea','abdominal pain','mucousy diarrhea','tenesmus','null','null','null','null');
  var celiac=disease('celiac disease','watery diarrhea','weight loss','bilateral leg edema','null','null','null','null','null');
  var vipoma=disease('vipoma','watery diarrhea','abdominal pain','null','null','null','null','null','null');
  var carcin=disease('carcinoid syndrome','watery diarrhea','abdominal pain','null','null','null','null','null','null');

  var liver=disease('liver disease','jaundice','jaundice','jaundice','null','family history','alcoholism','null','null');
  //gastric and pancreatic and mouth diseases will be left and to be viewed



  var gastritis=disease('gastririts','nausea','vomiting','abdominal pain','weight loss','alcoholism','null','null','null');
  var peptic=disease('peptic ulcer','abdominal pain','nausea','vomiting','weight loss','alcoholism','anorexia','null','null');
  var gasca=disease('gastric ca','abdominal pain','nausea','vomitng','weight loss','anorexia','null','null','null');
  var panc=disease('pancreatitis','abdominal pain','nausea','vomiting','null','null','null','null','null');
  var capanc=disease('pancreatic ca','abdominal pain','nausea','vomiting','weight loss','anorexia','null','null','null');
  var livab=disease('liver abcess','abdominal pain','fever','anorexia','null','null','null','null','null');
  var gallstone=disease('gallstone','abdominal pain','nausea','vomiting','null','null','null','null','null');
  var cagall=disease('gallbladder ca','abdominal pain','nausea','weight loss','null','null','null','null','null');
  //ca bile duct is overlapped
  var periton=disease('peritonitis','abdominal pain','nausea','vomiting','fever','null','null','null','null');




  var git=[gasent,achal,esospa,nutcrak,diver,esoring,ibd,sprue,bliloop,sbs,ple,ibs,celiac,vipoma,carcin,liver,];
  var g=0;
  var gg=git.length;
  var gitsym=[git[g].sym1,git[g].sym2,git[g].sym3,git[g].sym4,git[g].rf1,git[g].rf2,git[g].rf3,git[g].rf4];
  var gitkey=0;
  var gitlen=gitsym.length;
  var chiefcom='fatigue';
  var others=['palpitation','weight loss','bleeding'];
  var o=0;
  var oo=others.length;
  var riskf=['pregnancy','family history'];
  var r=0;
  var rr=riskf.length;
  var gitscore=0;

  while (gg>0){
    while(gitlen>0){
      if (chiefcom==gitsym[gitkey]){
        gitscore+=2;
      }
      while(oo>0){
        if (others[o]==gitsym[gitkey]){
          gitscore+=1;
        }
        o+=1;
        oo-=1;
      }
      while(rr>0){
        if (riskf[r]==gitsym[gitkey]){
          gitscore+=1;
        }
        r+=1;
        rr-=1;
      }
      o=0;
      oo=others.length;
      r=0;
      rr=riskf.length;
      gitlen-=1;
      gitkey+=1;
    }
    g+=1;
    gg-=1;
    if (gg>0){
      gitsym=[git[g].sym1,git[g].sym2,git[g].sym3,git[g].sym4,git[g].rf1,git[g].rf2,git[g].rf3,git[g].rf4];
      gitkey=0;
      gitlen=gitsym.length;
    }
  }
  print(gitscore);

}