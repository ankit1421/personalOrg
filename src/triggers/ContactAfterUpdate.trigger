trigger ContactAfterUpdate on Contact (after Update) {
    system.debug('--Trigger Old---' + Trigger.Old);
    System.debug('----Trigger New-' + Trigger.New);
}