<script>
	import '../app.pcss';
	import { page } from '$app/stores';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	
	import Sidebar from './Sidebar.svelte'; // Import the Sidebar component
	
	import logoUrl from '/images/cosmos-space-gravity-planet-svgrepo-com.svg';

	let site = {
		name: 'cosmos.pilled.me',
		href: '/blast-off',
		img: logoUrl
	};

	// use $page.path directly
	$: activeUrl = $page.url.pathname;
	onMount(() => {
		if (activeUrl === '/') {
			goto('/blast-off');
		}
	});
</script>

<Sidebar {activeUrl} {site} />

<div class="flex px-4 mx-auto w-full">
	<main class="main-content lg:ml-72 w-full mx-auto p-4 flex items-center justify-center">
		<slot />
	</main>
</div>

<style>
	.main-content {
		margin-top: 20px; /* Adjust this value as needed */
	}
</style>
