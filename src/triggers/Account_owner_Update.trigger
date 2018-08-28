trigger Account_owner_Update on Account (after insert) {
  system.debug('--------------');
  StaticFunctions.redirect();
    
}