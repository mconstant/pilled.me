<script>
	import { Heading, P, Button } from 'flowbite-svelte';
</script>

<style>
	.button-width {
		width: 20px; /* adjust as needed */
	}
</style>

<div>
	<Heading
		tag="h1"
		class="mb-6 text-center"
		customSize="text-4xl font-extrabold md:text-5xl lg:text-6xl"
	>
		🏛️ Get Keplr Wallet
	</Heading>
	<P class="text-center mb-6 text-lg lg:text-xl sm:px-16 xl:px-48">
		It's time to get set up with a wallet that works with all the Cosmos chains
	</P>
	<ol class="ps-5 mt-2 space-y-1 list-decimal list-inside text-gray-100">
		<li>
			Click the button below to Download and Install Keplr Wallet for Cosmos<br>
            <Button href="https://www.keplr.app/download" target=”_blank” class="button-width">
				<img src="images/intro-logo.png" alt="keplr-logo" />
			</Button>
		</li>
		<li>
			Choose <code>Create New Wallet</code><br>
            <img src="images/create-wallet.png" width="25%" alt="">
		</li>
		<li>Buy $20 of USDC on Coinbase</li>
	</ol>
</div>


