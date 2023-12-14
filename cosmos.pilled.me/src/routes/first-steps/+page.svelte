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
	<P class="text-center mb-6 text-lg lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">
		Are you a n00b?
	</P>
    <P class="text-center mb-6 text-lg lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">
		Here's what you need to do to get started.
	</P>
	<P class="mb-6 text-lg lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">
		1. Know the <Button href="/must-knows">🚨 Must Knows</Button>
	</P>
    <div class="text-center">
        <Button href="/first-steps">Start Here</Button>
    </div>
</div>
