<style>
	.carousel-control-next {
		color: #FFF;
		font-size: 35px;
		font-weight: bold;
		position: absolute;
		right: 5%;
		top: 48%;
	}

	.carousel-control-next:visited, .carousel-control-prev:visited {
		color: #FFF;
	}

	.carousel-control-prev {
		color: #FFF;
		font-size: 35px;
		font-weight: 700;
		left: 5%;
		position: absolute;
		top: 48%;
	}

	.carousel-indicators li {
		border: 2px solid #FFF;
		height: 12px;
		width: 12px;
	}

	.carousel-main-container {
		height: auto;
		width: 100%;
	}

	.link-to-image {
		display: block;
		height: 600px;
		margin: auto;
		width: 100%;
	}

	.slides {
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		margin: auto;
		min-height: 600px;
		width: 100%;
	}
</style>

<#if entries?has_content>
	<div class="carousel-main-container" id="<@portlet.namespace />carousel">
		<#assign imageMimeTypes = propsUtil.getArray("dl.file.entry.preview.image.mime.types") />

		<#list entries as entry>
			<#if imageMimeTypes?seq_contains(entry.getMimeType())>
				<div class="slides" style="background-image: url(${dlUtil.getPreviewURL(entry, entry.getFileVersion(), themeDisplay, "")})">
					<a href="${dlUtil.getPreviewURL(entry, entry.getFileVersion(), themeDisplay, "")}">
						<span aria-hidden="true" class="link-to-image"></span>
					</a>

					<a class="carousel-control-prev" data-slide="prev" href="#carouselExampleIndicators" onclick="paginate(-1)" role="button">
						<span aria-hidden="true" class="carousel-control-prev-icon"><</span>
						<span class="sr-only">Previous</span>
					</a>

					<a class="carousel-control-next" data-slide="next" href="#carouselExampleIndicators" onclick="paginate(1)" role="button">
						<span aria-hidden="true" class="carousel-control-next-icon">></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</#if>
		</#list>

		<ul class="carousel-indicators">
			<#list entries as entry>
				<li class="carousel-indicator" onclick="indicatorClick(${entry?index})"></li>
			</#list>
		</ul>
	</div>
</#if>

<script>
	var changeSlide = setInterval(carousel, 5000, 1);
	var slideIndex = 0;

	function carousel(direction) {
		var carouselIndicator = document.getElementsByClassName('carousel-indicator');
		var slides = document.getElementsByClassName('slides');

		for (var i = 0; i < slides.length; i++) {
			slides[i].style.display = 'none';
			carouselIndicator[i].style.backgroundColor = 'transparent';
			carouselIndicator[i].id = i;
		}

		if (direction == -1) {
		slideIndex--;
		}

		if (direction == 1) {
			slideIndex++;
		}

		if (slideIndex < 1) {
			slideIndex = slides.length;
		}

		if (slideIndex > slides.length) {
			slideIndex = 1;
		}

		slides[slideIndex - 1].style.display = 'block';
		carouselIndicator[slideIndex - 1].style.backgroundColor = '#FFF';
	}

	function indicatorClick(indicatorIndex) {
		clearInterval(changeSlide);
		slideIndex = indicatorIndex;
		carousel(1);
	}

	function paginate(direction) {
		clearInterval(changeSlide);
		carousel(direction);
	}

	Liferay.on(
		'beforeNavigate',
			function(event) {
				clearInterval(changeSlide);
			}
	);

carousel(1);

</script>