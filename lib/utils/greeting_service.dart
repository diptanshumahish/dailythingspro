import 'dart:math';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

const generalGreetings = [
  "How are you?",
  "What's up friend",
  "What's cooking today?",
  "What's popping?",
  "Ready to crush it today?",
  "All systems go?",
  "What's the good word?",
  "Anything exciting happening today?",
  "What adventures await?",
  "Mind blown by anything cool lately?",
  "What's shakin', bacon?",
  "Did you survive [day of the week]?",
  "Is it coffee time yet?",
  "How you doin'?"
];

const morningGirlYoung = [
  "Rise and shine, superstar!",
  "Good morning, fierce human!",
  "Ready to rock this day?",
  "Sweet dreams over, let's do this!",
  "Wishing you a morning as bright as your smile!",
  "Hope your coffee is strong and your day is awesome!",
  "New day, new slay! "
];

const morningBoy = [
  "What's up, champ?",
  "Morning, legend! Ready for some adventure?",
  "Level up time! Did you sleep like a champion?",
  "Sun's out, guns out! (Let's conquer the day!)",
  "Did you dream of awesome things last night?",
  "Ready to build something epic today?",
  "Game on! Let's make it a winning day!"
];

const afternoonGirl = [
  "Crushing this afternoon? 🤗",
  "Afternoon, queen! How's your day going?",
  "Hope your afternoon is sparkling like your personality!",
  "Slaying it this afternoon? ",
  "Fueling up for an awesome after-school adventure?",
  "Ready to conquer the rest of your day? ",
  "Just a reminder you're amazing! How's your afternoon going?",
  "Hope your afternoon is full of good vibes and good friends!"
];

const afternoonBoy = [
  "What's up, dude! Afternoon adventures about to start?",
  "Top of the afternoon, champ! Ready to crush the rest of the day?",
  "Afternoon, legend! How many epic things have you done today?",
  "Sun's still out, time for more wins! How's your afternoon going?",
  "Did you find any hidden treasure this afternoon?",
  "Ready to build something even more awesome this afternoon?",
  "Fueling up for some afternoon action? 😎",
  "Just checking in, is your afternoon as awesome as you are?"
];

const evening = [
  "Good evening! How's your evening going?",
  "Hope you're having a lovely evening!",
  "Ready to unwind after a long day?",
  "Sun's setting, time to relax and recharge!",
  "Beautiful evening, isn't it?",
  "Just checking in - how's your evening shaping up?",
  "Big plans for this evening?",
  "Ready for some cozy vibes this evening?",
  "Enjoy the rest of your evening!"
];

const nightGirl = [
  "Good night, sleep tight! Wishing you the sweetest dreams!",
  "Hope you had a magical day! Sweet dreams!",
  "Stars are out, shining bright just like you! Sweet dreams!",
  "Ready to conquer dreamland tonight?",
  "Time to unwind and recharge for tomorrow's adventures! Sweet dreams!",
  "Wishing you a night filled with peaceful slumber and beautiful dreams!",
  "Night owl, huh? Sending you sparkly dreams!",
  "Just checking in - did you dream up anything amazing tonight?",
  "Sweet dreams, wonder girl!"
];

const nightBoy = [
  "Good night, champ! How was your day?",
  "Hope you had a blast today! Time to recharge for tomorrow's adventures!",
  "Stars are out, ready to dream up some epic battles tonight?",
  "Time to power down and become super strong for tomorrow! Sweet dreams!",
  "Night owl, huh? Hope you dream of building the coolest things!",
  "Just checking in - did you defeat any villains in your dreams tonight?",
  "Sweet dreams, legend!"
];

int getRandomNumber(int max) {
  if (max < 0) {
    throw ArgumentError('The argument must be a non-negative integer.');
  }
  return Random().nextInt(max + 1);
}

String greetUser(TimeOfDay t, String gender) {
  final int timeOfDay = t.hour;
  if (gender == "M") {
    if (timeOfDay > 4 && timeOfDay <= 12) {
      return morningBoy[getRandomNumber(morningBoy.length - 1)];
    } else if (timeOfDay > 12 && timeOfDay <= 17) {
      return afternoonBoy[getRandomNumber(afternoonBoy.length - 1)];
    } else if (timeOfDay > 17 && timeOfDay < 21) {
      return evening[getRandomNumber(evening.length - 1)];
    } else {
      return nightBoy[getRandomNumber(nightBoy.length - 1)];
    }
  } else if (gender == "F") {
    if (timeOfDay > 4 && timeOfDay <= 12) {
      return morningGirlYoung[getRandomNumber(morningGirlYoung.length - 1)];
    } else if (timeOfDay > 12 && timeOfDay <= 17) {
      return afternoonGirl[getRandomNumber(afternoonGirl.length - 1)];
    } else if (timeOfDay > 17 && timeOfDay < 21) {
      return evening[getRandomNumber(evening.length - 1)];
    } else {
      return nightGirl[getRandomNumber(nightGirl.length - 1)];
    }
  }

  return generalGreetings[getRandomNumber(generalGreetings.length - 1)];
}
