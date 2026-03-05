			// Audio Slider Logic
			const audioTrack = document.getElementById('audio-slider-track');
			const audioPrevBtn = document.getElementById('audio-prev');
			const audioNextBtn = document.getElementById('audio-next');
			const mobileAudioPrevBtn = document.getElementById('mobile-audio-prev');
			const mobileAudioNextBtn = document.getElementById('mobile-audio-next');
			const audioDots = document.querySelectorAll('.audio-dot');
			const totalAudioSlides = document.querySelectorAll('.audio-slide').length;
			let currentAudioSlide = 0;

			function updateAudioSlider() {
				if(!audioTrack) return;
				// Move track
				audioTrack.style.transform = `translateX(-${currentAudioSlide * 100}%)`;

				// Update dots
				audioDots.forEach((dot, index) => {
					if (index === currentAudioSlide) {
						dot.classList.remove('bg-amber-900/50', 'w-2.5');
						dot.classList.add('bg-amber-400', 'w-6');
					} else {
						dot.classList.remove('bg-amber-400', 'w-6');
						dot.classList.add('bg-amber-900/50', 'w-2.5');
					}
				});

				// Update Prev Buttons State
				if (currentAudioSlide === 0) {
					if (audioPrevBtn) {
						audioPrevBtn.disabled = true;
						audioPrevBtn.classList.add('opacity-40', 'cursor-not-allowed');
						audioPrevBtn.classList.remove('hover:bg-amber-800/40', 'hover:bg-amber-800/50', 'cursor-pointer');
					}
					if (mobileAudioPrevBtn) {
						mobileAudioPrevBtn.disabled = true;
						mobileAudioPrevBtn.classList.add('opacity-40', 'cursor-not-allowed');
						mobileAudioPrevBtn.classList.remove('hover:bg-amber-800/40', 'hover:bg-amber-800/50', 'cursor-pointer');
					}
				} else {
					if (audioPrevBtn) {
						audioPrevBtn.disabled = false;
						audioPrevBtn.classList.remove('opacity-40', 'cursor-not-allowed');
						audioPrevBtn.classList.add('hover:bg-amber-800/50', 'cursor-pointer');
					}
					if (mobileAudioPrevBtn) {
						mobileAudioPrevBtn.disabled = false;
						mobileAudioPrevBtn.classList.remove('opacity-40', 'cursor-not-allowed');
						mobileAudioPrevBtn.classList.add('hover:bg-amber-800/50', 'cursor-pointer');
					}
				}

				// Update Next Buttons State
				if (currentAudioSlide === totalAudioSlides - 1) {
					if (audioNextBtn) {
						audioNextBtn.disabled = true;
						audioNextBtn.classList.add('opacity-40', 'cursor-not-allowed');
						audioNextBtn.classList.remove('hover:bg-amber-800/40', 'hover:bg-amber-800/50', 'cursor-pointer');
					}
					if (mobileAudioNextBtn) {
						mobileAudioNextBtn.disabled = true;
						mobileAudioNextBtn.classList.add('opacity-40', 'cursor-not-allowed');
						mobileAudioNextBtn.classList.remove('hover:bg-amber-800/40', 'hover:bg-amber-800/50', 'cursor-pointer');
					}
				} else {
					if (audioNextBtn) {
						audioNextBtn.disabled = false;
						audioNextBtn.classList.remove('opacity-40', 'cursor-not-allowed');
						audioNextBtn.classList.add('hover:bg-amber-800/50', 'cursor-pointer');
					}
					if (mobileAudioNextBtn) {
						mobileAudioNextBtn.disabled = false;
						mobileAudioNextBtn.classList.remove('opacity-40', 'cursor-not-allowed');
						mobileAudioNextBtn.classList.add('hover:bg-amber-800/50', 'cursor-pointer');
					}
				}
			}

			function nextAudioSlide() {
				if (currentAudioSlide < totalAudioSlides - 1) {
					currentAudioSlide++;
					updateAudioSlider();
				}
			}

			function prevAudioSlide() {
				if (currentAudioSlide > 0) {
					currentAudioSlide--;
					updateAudioSlider();
				}
			}

			if (audioNextBtn) audioNextBtn.addEventListener('click', nextAudioSlide);
			if (audioPrevBtn) audioPrevBtn.addEventListener('click', prevAudioSlide);
			if (mobileAudioNextBtn) mobileAudioNextBtn.addEventListener('click', nextAudioSlide);
			if (mobileAudioPrevBtn) mobileAudioPrevBtn.addEventListener('click', prevAudioSlide);
			
			audioDots.forEach((dot, index) => {
				dot.addEventListener('click', () => {
					currentAudioSlide = index;
					updateAudioSlider();
				});
			});

			let audioTouchStartX = 0;
			let audioTouchEndX = 0;
			const audioViewport = document.getElementById('audio-viewport');
			if(audioViewport) {
				audioViewport.addEventListener('touchstart', e => {
					audioTouchStartX = e.changedTouches[0].screenX;
				});

				audioViewport.addEventListener('touchend', e => {
					audioTouchEndX = e.changedTouches[0].screenX;
					if (audioTouchStartX - audioTouchEndX > 50) nextAudioSlide();
					else if (audioTouchEndX - audioTouchStartX > 50) prevAudioSlide();
				});
			}

			updateAudioSlider();

			// Testimonial slider logic (in case it is missing)
			const testimonialTrack = document.getElementById('testimonial-slider-track');
			let currentTestimonialSlide = 0;
			if(testimonialTrack) {
				// find slides
				const testimonialSlides = testimonialTrack.children.length;
				function nextTestimonial() {
					currentTestimonialSlide = (currentTestimonialSlide + 1) % testimonialSlides;
					testimonialTrack.style.transform = `translateX(-${currentTestimonialSlide * 100}%)`;
				}
				setInterval(nextTestimonial, 5000);
			}

			// End script additions
