trigger FirstTrigger on Account (before insert) {
	System.debug('First Trigger Executed.');
}