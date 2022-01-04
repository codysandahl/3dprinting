
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module jerusalem_cross(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-54.778480,-159.500000],[-49.533530,-165.602413],[-43.623662,-170.777756],[-37.143614,-175.046109],[-30.188127,-178.427550],[-22.851937,-180.942158],[-15.229785,-182.610011],[-7.416408,-183.451187],[0.493454,-183.485765],[8.405063,-182.733824],[16.223680,-181.215442],[23.854567,-178.950698],[31.202985,-175.959670],[38.174195,-172.262436],[44.673458,-167.879076],[50.606036,-162.829668],[55.877190,-157.134290],[55.699252,-153.689390],[54.873366,-150.523874],[53.494076,-147.595499],[51.655928,-144.862021],[49.453466,-142.281198],[46.981235,-139.810787],[41.605646,-135.032230],[36.285520,-130.188406],[33.882618,-127.636411],[31.777216,-124.941372],[30.063860,-122.061043],[28.837093,-118.953184],[28.191462,-115.575551],[28.221510,-111.885900],[28.221510,23.500000],[-28.778490,23.500000],[-28.778490,-114.500000],[-29.158786,-117.913603],[-30.203493,-121.075077],[-31.805799,-124.021276],[-33.858894,-126.789053],[-38.890208,-131.936753],[-44.442950,-136.813002],[-49.662634,-141.712627],[-51.880552,-144.263337],[-53.694773,-146.930451],[-54.998488,-149.750821],[-55.684884,-152.761300],[-55.647152,-155.998742],[-54.778480,-159.500000]]);
    linear_extrude(height=h)
      polygon([[54.778480,159.500000],[49.533530,165.602413],[43.623662,170.777756],[37.143614,175.046109],[30.188127,178.427550],[22.851937,180.942158],[15.229785,182.610011],[7.416408,183.451187],[-0.493454,183.485765],[-8.405063,182.733824],[-16.223680,181.215442],[-23.854567,178.950698],[-31.202985,175.959670],[-38.174195,172.262436],[-44.673458,167.879076],[-50.606036,162.829668],[-55.877190,157.134290],[-55.699252,153.689390],[-54.873366,150.523874],[-53.494076,147.595499],[-51.655928,144.862021],[-49.453466,142.281198],[-46.981235,139.810787],[-41.605646,135.032230],[-36.285520,130.188406],[-33.882618,127.636411],[-31.777216,124.941372],[-30.063860,122.061043],[-28.837093,118.953184],[-28.191462,115.575551],[-28.221510,111.885900],[-28.221510,-23.500000],[28.778490,-23.500000],[28.778490,114.500000],[29.158786,117.913603],[30.203493,121.075077],[31.805799,124.021276],[33.858894,126.789053],[38.890208,131.936753],[44.442950,136.813002],[49.662634,141.712627],[51.880552,144.263337],[53.694773,146.930451],[54.998488,149.750821],[55.684884,152.761300],[55.647152,155.998742],[54.778480,159.500000]]);
    linear_extrude(height=h)
      polygon([[159.500000,-54.778480],[165.602413,-49.533530],[170.777756,-43.623662],[175.046109,-37.143614],[178.427550,-30.188127],[180.942158,-22.851937],[182.610011,-15.229785],[183.451187,-7.416408],[183.485765,0.493454],[182.733824,8.405063],[181.215442,16.223680],[178.950698,23.854567],[175.959670,31.202985],[172.262436,38.174195],[167.879076,44.673458],[162.829668,50.606036],[157.134290,55.877190],[153.689390,55.699252],[150.523874,54.873366],[147.595499,53.494076],[144.862021,51.655928],[142.281198,49.453466],[139.810787,46.981235],[135.032230,41.605646],[130.188406,36.285520],[127.636411,33.882618],[124.941372,31.777216],[122.061043,30.063860],[118.953184,28.837093],[115.575551,28.191462],[111.885900,28.221510],[-23.500000,28.221510],[-23.500000,-28.778490],[114.500000,-28.778490],[117.893307,-29.148470],[121.044228,-30.188145],[123.988108,-31.789867],[126.760292,-33.845986],[131.930956,-38.890826],[136.838982,-44.461479],[141.767137,-49.696757],[144.327125,-51.919510],[146.998182,-53.735475],[149.815652,-55.037002],[152.814881,-55.716444],[156.031216,-55.666153],[159.500000,-54.778480]]);
    linear_extrude(height=h)
      polygon([[-159.500000,54.778490],[-165.602412,49.533540],[-170.777754,43.623671],[-175.046107,37.143623],[-178.427548,30.188135],[-180.942156,22.851945],[-182.610009,15.229792],[-183.451186,7.416414],[-183.485765,-0.493449],[-182.733825,-8.405059],[-181.215443,-16.223677],[-178.950699,-23.854565],[-175.959672,-31.202983],[-172.262438,-38.174194],[-167.879078,-44.673458],[-162.829669,-50.606036],[-157.134290,-55.877190],[-153.689390,-55.699252],[-150.523874,-54.873366],[-147.595499,-53.494076],[-144.862021,-51.655928],[-142.281198,-49.453466],[-139.810787,-46.981235],[-135.032230,-41.605646],[-130.188406,-36.285520],[-127.636411,-33.882618],[-124.941372,-31.777216],[-122.061043,-30.063860],[-118.953184,-28.837093],[-115.575551,-28.191462],[-111.885900,-28.221510],[23.500000,-28.221510],[23.500000,28.778490],[-114.500000,28.778490],[-117.893307,29.148470],[-121.044228,30.188146],[-123.988108,31.789867],[-126.760292,33.845988],[-131.930956,38.890829],[-136.838982,44.461484],[-141.767137,49.696764],[-144.327125,51.919518],[-146.998182,53.735483],[-149.815652,55.037011],[-152.814881,55.716454],[-156.031216,55.666163],[-159.500000,54.778490]]);
  }
}

//jerusalem_cross(2);


// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module jerusalem_cross_top(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[149.481051,-33.334980],[154.745263,-29.438730],[159.307581,-25.576235],[163.168003,-21.730139],[166.326531,-17.883087],[168.783163,-14.017722],[170.537901,-10.116688],[171.590743,-6.162630],[171.941691,-2.138190],[171.590743,1.973986],[170.537901,6.191256],[168.783163,10.530974],[166.326531,15.010497],[163.168003,19.647181],[159.307581,24.458383],[154.745263,29.461457],[149.481051,34.673760],[147.547650,36.301868],[146.046942,37.104668],[144.864662,37.181546],[143.886544,36.631883],[142.085731,34.050473],[139.730378,30.155504],[138.059085,27.963894],[135.906359,25.742044],[133.157936,23.589340],[129.699549,21.605162],[125.416932,19.888896],[120.195821,18.539925],[113.921949,17.657632],[106.481051,17.341400],[-21.941689,25.341400],[-21.941689,-28.002620],[106.481051,-18.002620],[113.904081,-17.724962],[120.129113,-18.080670],[125.277561,-18.969335],[129.470836,-20.290547],[132.830353,-21.943899],[135.477523,-23.828980],[137.533761,-25.845382],[139.120478,-27.892696],[141.371005,-31.678426],[143.200407,-34.382897],[144.260718,-35.078639],[145.579987,-35.202839],[147.279627,-34.655089],[149.481051,-33.334980]]);
    linear_extrude(height=h)
      polygon([[-38.334979,-153.481050],[-34.382577,-158.745263],[-30.361391,-163.307580],[-26.268713,-167.168003],[-22.101836,-170.326530],[-17.858053,-172.783163],[-13.534656,-174.537900],[-9.128937,-175.590743],[-4.638189,-175.941690],[-0.059704,-175.590743],[4.609225,-174.537900],[9.371307,-172.783163],[14.229248,-170.326530],[19.185756,-167.168003],[24.243540,-163.307580],[29.405305,-158.745263],[34.673761,-153.481050],[36.301868,-151.547649],[37.104669,-150.046941],[37.181546,-148.864661],[36.631884,-147.886543],[34.050473,-146.085731],[30.155504,-143.730378],[27.963894,-142.059084],[25.742045,-139.906358],[23.589340,-137.157935],[21.605163,-133.699548],[19.888897,-129.416931],[18.539926,-124.195820],[17.657632,-117.921948],[17.341401,-110.481050],[25.341401,17.941690],[-28.002619,17.941690],[-18.002619,-110.481050],[-17.781114,-117.904080],[-18.295513,-124.129112],[-19.430760,-129.277560],[-21.071797,-133.470835],[-23.103566,-136.830352],[-25.411010,-139.477522],[-27.879073,-141.533760],[-30.392696,-143.120477],[-35.096394,-145.371004],[-38.601646,-147.200406],[-39.617212,-148.260717],[-39.987994,-149.579987],[-39.598936,-151.279627],[-38.334979,-153.481050]]);
    linear_extrude(height=h)
      polygon([[33.334981,153.481050],[29.438731,158.745262],[25.576236,163.307580],[21.730140,167.168002],[17.883088,170.326530],[14.017723,172.783163],[10.116689,174.537900],[6.162630,175.590742],[2.138191,175.941690],[-1.973986,175.590742],[-6.191255,174.537900],[-10.530973,172.783163],[-15.010496,170.326530],[-19.647181,167.168002],[-24.458382,163.307580],[-29.461456,158.745262],[-34.673759,153.481050],[-36.301867,151.547649],[-37.104668,150.046941],[-37.181545,148.864661],[-36.631883,147.886543],[-34.050472,146.085731],[-30.155503,143.730378],[-27.963893,142.059084],[-25.742044,139.906358],[-23.589339,137.157935],[-21.605162,133.699548],[-19.888896,129.416931],[-18.539924,124.195820],[-17.657631,117.921948],[-17.341399,110.481050],[-25.341399,-17.941690],[28.002621,-17.941690],[18.002621,110.481050],[17.724963,117.904080],[18.080671,124.129112],[18.969336,129.277559],[20.290548,133.470834],[21.943899,136.830350],[23.828980,139.477520],[25.845383,141.533757],[27.892697,143.120474],[31.678427,145.371000],[34.382898,147.200402],[35.078639,148.260714],[35.202840,149.579984],[34.655090,151.279625],[33.334981,153.481050]]);
    linear_extrude(height=h)
      polygon([[-149.481049,33.334980],[-154.745262,29.438730],[-159.307580,25.576235],[-163.168003,21.730139],[-166.326530,17.883087],[-168.783163,14.017722],[-170.537901,10.116688],[-171.590743,6.162630],[-171.941691,2.138190],[-171.590743,-1.973986],[-170.537901,-6.191256],[-168.783163,-10.530974],[-166.326530,-15.010497],[-163.168003,-19.647181],[-159.307580,-24.458383],[-154.745262,-29.461457],[-149.481049,-34.673760],[-147.547648,-36.301868],[-146.046940,-37.104668],[-144.864660,-37.181546],[-143.886542,-36.631883],[-142.085729,-34.050473],[-139.730376,-30.155504],[-138.059083,-27.963894],[-135.906357,-25.742044],[-133.157934,-23.589340],[-129.699547,-21.605162],[-125.416931,-19.888896],[-120.195819,-18.539925],[-113.921947,-17.657632],[-106.481049,-17.341400],[21.941691,-25.341400],[21.941691,28.002620],[-106.481049,18.002620],[-113.904079,17.724962],[-120.129111,18.080670],[-125.277559,18.969335],[-129.470834,20.290547],[-132.830350,21.943899],[-135.477520,23.828980],[-137.533758,25.845382],[-139.120475,27.892696],[-141.371001,31.678426],[-143.200403,34.382897],[-144.260715,35.078639],[-145.579984,35.202839],[-147.279625,34.655089],[-149.481049,33.334980]]);
  }
}

//jerusalem_cross_top(4);