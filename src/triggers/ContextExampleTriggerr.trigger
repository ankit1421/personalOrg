trigger ContextExampleTriggerr on Task (after insert) {
    CalloutClass.makeCallout();
}