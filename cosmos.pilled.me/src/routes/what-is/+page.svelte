<script>
	import { Heading, P, Button } from 'flowbite-svelte';
</script>

<div>
	<Heading
		tag="h1"
		class="mb-6 text-center"
		customSize="text-4xl font-extrabold md:text-5xl lg:text-6xl"
	>
    🪐 What is Cosmos
	</Heading>
	<P class="text-center mb-6 text-lg lg:text-xl sm:px-16 xl:px-48 dark:text-gray-100">
		Cosmos is an "Internet of Blockchains"
	</P>
    <ul class="space-y-4 text-gray-100 list-disc list-inside">
        <li>
            It is composed of "App Chains"
        </li>
        <li>
            The app chains are bridged by something called IBC that makes it easy to transfer assets across chains
        </li>
        <li>
            App chains are made to serve specific use cases
        </li>
    </ul>
    <br>
    <div class="text-center">
        <Button href="/first-steps">▶️ First Steps</Button>
    </div>
</div>
