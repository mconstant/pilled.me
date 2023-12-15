<script>
	import { Heading, P, Button } from 'flowbite-svelte';
</script>

<div>
	<Heading
		tag="h1"
		class="mb-6 text-center"
		customSize="text-4xl font-extrabold md:text-5xl lg:text-6xl"
	>
    ▶️ First Steps
	</Heading>
	<P class="text-center mb-6 text-lg lg:text-xl sm:px-16 xl:px-48">
		Are you a n00b?
	</P>
    <P class="text-center mb-6 text-lg lg:text-xl sm:px-16 xl:px-48">
		Here's what you need to do to get started.
	</P>
	<ol class="ps-5 mt-2 space-y-1 list-decimal list-inside text-gray-100">
        <li>
            Know the <Button href="/must-knows">🚨 Must Knows</Button>
        </li>
        <li>
            Set up <Button href="/keplr-wallet">🏛️ Keplr Wallet</Button>
        </li>
        <li>
            Buy $20 of USDC on Coinbase
        </li>
    </ol>
</div>
