{
    "ComControllerName":"GIDependency",
    "SubComController":{
         "State":["state(GIDependency)","state(SGPOI)","state(GCO)"],
         "Event":["do(nothing)","start(SGPOI)","start(GCO)"],
         "Tran":[
             {"source": "state(GIDependency)", "migrateevent": "start(GIDependency)", "destination": "state(SGPOI)"}
             {"source": "state(SGPOI)", "migrateevent": "done(SGPOI)", "destination": "state(GCO)"},
             {"source": "state(GCO)", "migrateevent":"done(GCO)", "destination": "state(GIDependency)"}
         ]
     },
     "Connector_controller":[
     {"Sender":"GIDependency","Signal":"start(GCO)","Receiver":"GCO"},
     {"Sender":"GCO","Signal":"done(GCO)","Receiver":"GIDependency"},
     {"Sender":"GIDependency","Signal":"start(SGPOI)","Receiver":"SGPOI"},
     {"Sender":"SGPOI","Signal":"done(SGPOI)","Receiver":"GIDependency"},
     ]
}
