import 'package:flutter/material.dart';




/*customSingleInputDialog(  
	context,  
	Text("Enter Card Holer Name"),  
	DialogTextField(  
		fieldLabel: "Name",  
		obscureText: false,  
		textInputType: TextInputType.text,   
		validator: (value) {  
			if (value.isEmpty) return "Required!";  
			return null;  
		},  
		onEditingComplete: (value) {  
			print(value);  
		}  
	),  
	positiveButtonText: "Confirm",  
	positiveButtonAction: (value) {  
		if (documentNumber.contains(code)) {
            Navigator.pop(context);
            soundEffect.play(error!);
            ElegantNotification.error(
                    toastDuration: Duration(seconds: 2),
                    height: 70,
                    animation: ANIMATION.fromTop,
                    title: Text("Denied"),
                    description: Text("Document already exist"))
                .show(context);
          } else if (!documentNumber.contains(code)) {
            addItem(code, _nameController.text);
            Navigator.pop(context);

            soundEffect.play(soundId!);
            ElegantNotification.success(
                    toastDuration: Duration(seconds: 2),
                    height: 70,
                    animation: ANIMATION.fromTop,
                    title: Text("Added Loyalty Card"),
                    description: Text("You added a card successfully"))
                .show(context);
          }
	},  
	negativeButtonText: "Cancel",  
	negativeButtonAction: () {
    Navigator.pop(context);
  },  
	hideNeutralButton: false,  
	closeOnBackPress: true,  
);*/
