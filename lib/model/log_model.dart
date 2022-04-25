class LogModel{
  String? email;
  String? action;
  String? ipv4;
  String? ipv64;
  String? time;

  LogModel({

    this.email, 
    this.action,
    this.ipv4,
    this.ipv64,
    this.time
    });

  //data from the server
factory LogModel.fromMap(map){
  return LogModel(
    email: map['email'],
    action: map['action'],
    ipv4: map['ipv4'],
    ipv64: map['ipv64'],
    time: map['time'],
  );
}

  Map<String, dynamic> toMap(){
    return{
      'email': email,
      'ipv4': ipv4,
      'ipv64': ipv64,
      'time': time,
      'action': action,
    };
  }
}